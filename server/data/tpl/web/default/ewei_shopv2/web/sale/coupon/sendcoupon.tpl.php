<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<div class="page-heading"> 
	
	<span class='pull-right'>
		<a class="btn btn-default  btn-sm" href="<?php  echo webUrl('sale/coupon')?>">返回列表</a>
	</span>
    <h2>发放优惠券 </h2>

</div>
<ul class="nav nav-arrow-next nav-tabs" id="settingTab">
    <li class="active"><a href="#tab_base">发送信息设置</a></li>
    <li ><a href="#tab_customnotice">客服消息设置</a></li>
    <li ><a href="#tab_setting">模板消息设置</a></li>
</ul>


<form action="" method="post" class="form-horizontal form-validate" enctype="multipart/form-data">

    <div class="tab-content">
        <div class="tab-pane active" id="tab_base"  ><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('sale/coupon/sendcoupon/base', TEMPLATE_INCLUDEPATH)) : (include template('sale/coupon/sendcoupon/base', TEMPLATE_INCLUDEPATH));?>
        </div>
        <div class="tab-pane" id="tab_customnotice"  ><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('sale/coupon/sendcoupon/customnotice', TEMPLATE_INCLUDEPATH)) : (include template('sale/coupon/sendcoupon/customnotice', TEMPLATE_INCLUDEPATH));?>
        </div>
        <div class="tab-pane" id="tab_setting"  ><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('sale/coupon/sendcoupon/templatenotice', TEMPLATE_INCLUDEPATH)) : (include template('sale/coupon/sendcoupon/templatenotice', TEMPLATE_INCLUDEPATH));?>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" ></label>
        <div class="col-sm-9 col-xs-12">
            <div class="help-block">
                <input id='btn' type="button" name="button" value="确认发放" class="btn btn-primary"  onclick="send()"/>
            </div>
        </div>
    </div>

</form>


<script>
    require(['bootstrap'],function(){
        $('#settingTab a').click(function (e) {
            e.preventDefault();
            $('#tab').val( $(this).attr('href'));
            $(this).tab('show');
        })
    });


    $(function () {
        $(':radio[name=send1]').click(function () {
            var v = $(this).val();
            $(".choose").hide();
            $(".choose_" + v).show();
        })

        $('form').submit(function () {


            send_total = parseInt(send_total);
            if (send_total <= 0) {
                $('#send_total').focus();
                tip.msgbox.err( '最少发放一张!');
                $('form').attr('stop',1);
                return false;
            }
            var c = $('input[name=send1]:checked').val();
            var v = $('#value_' + c).val();
            if (c == 1 && v == '') {
                tip.msgbox.err('请输入要发放的用户Openid!');
                $('form').attr('stop',1);
                return false;
            }
            $('form').removeAttr('stop');
            return true;
        });
    });
</script>

<script>
    $(function(){
        $(':radio[name=send1]').click(function(){
            var v = $(this).val();
            $(".choose").hide();
            $(".choose_"+v).show();
        })
    })

    var openids = [];

    function send(){
        var btn = $('input[type=button]');
        if(btn.attr('sending')=='1'){
            return;
        }

        var c = $('input[name=send1]:checked').val();
        var v = $('#send_openid').val();

        if (c == 1 && v == '') {
            tip.msgbox.err('请输入要发放的用户Openid!');
            return false;
        }

        var send_total =$('#send_total').val(),

        send_total = parseInt(send_total);
        if (send_total <= 0) {
            $('#send_total').focus();
            tip.msgbox.err( '最少发放一张!');
            return false;
        }

        btn.removeClass('btn-primary').val('正在获取发送的用户Openid...').attr('sending',1);

        var messagetype = $('input[name=messagetype]:checked').val();


        var data ={
            couponid : $('#couponid').val(),
            send_total : $('#send_total').val(),
            send1 : $('input[name=send1]:checked').val(),
            send_openid  : $('#send_openid').val(),
            send_level  : $('#send_level').val(),
            send_group  : $('#send_group').val(),
            send_agentlevel  : $('#send_agentlevel').val(),
            send_partnerlevels  : $('#send_partnerlevels').val(),
            send_aagentlevels  : $('#send_aagentlevels').val(),

            sendtemplateid  : $('#sendtemplateid').val(),
            frist  : $('#frist').val(),
            fristcolor  : $('#fristcolor').val(),
            keyword1  : $('#keyword1').val(),
            keyword1color  : $('#keyword1color').val(),
            keyword2  : $('#keyword2').val(),
            keyword2color : $('#keyword2color').val(),
            remark  : $('#remark').val(),
            remarkcolor  : $('#remarkcolor').val(),
            templateurl : $('#templateurl').val(),

            custitle  : $('#custitle').val(),
            custhumb  : $('input[name=custhumb]').val(),
            cusdesc  : $('#cusdesc').val(),
            cusurl  : $('#cusurl').val()
        }

        $.ajax({
            url: "<?php  echo webUrl('sale/coupon/sendcoupon/fetch')?>",
            type:'post',
            dataType:'json',
            data:data,
            success:function(data){
                if(messagetype !=0)
                {
                    if(data.status==1){
                        openids = data.result.openids;
                        btn.val('共要发送给 ' + openids.length +  " 个用户，准备发送!");
                        sendmessage();
                    } else{
                        btn.addClass('btn-primary').removeAttr('sending').val('立即发送');
                        tip.msgbox.err( data.result.message );
                    }
                }else
                {
                    if(data.status==1){
                        btn.addClass('btn-primary').removeAttr('sending').val('立即发送');
                        tip.msgbox.err('发送完成');
                    } else{
                        btn.addClass('btn-primary').removeAttr('sending').val('立即发送');
                        tip.msgbox.err( data.result.message );
                    }
                }

            }
        });
    }
    var current = 0;
    var failed = [];
    var failmsg = "";
    var succeed = 0;
    function sendmessage(){
        var btn = $('input[type=button]');
        var messagetype = $('input[name=messagetype]:checked').val();

        if(current>openids.length-1){
            if(failed.length>0){
                var msg = '发送成功 ' + succeed + ' 个用户，失败 ' + failed.length + " 个用户:\r\n";
                msg+=failmsg;
                msg+="\r\n 是否继续发送失败的用户? ";
                tip.confirm(msg,function(){
                    current = 0 ;succeed=0;
                    openids = failed;
                    failed=[];
                    failmsg= "";
                    btn.val('共要发送给 ' + openids.length + " 个用户，准备发送!");
                    sendmessage();
                    return;
                },function(){
                    location.reload();
                })
            } else{
                tip.msgbox.suc('发送成功 ' + succeed + ' 个用户!',"<?php  echo webUrl('sale/coupon/sendcoupon')?>" );
            }
            return;
        }

        var openid = openids[current];

        $.ajax({
            url: "<?php  echo webUrl('sale/coupon/sendcoupon/sendmessage')?>",
            type:'post',
            data: {'openid':openid, messagetype: messagetype},
            dataType:'json',
            success:function(result2){

                if(result2.result=='1'){
                    succeed++;
                }
                else{
                    failmsg+= result2.openid + "\r\n(错误信息: " + result2.message + ")\r\n\r\n";
                    failed.push(result2.openid);
                }
                btn.val('已经发送 ' + current + " / " + openids.length + " 个用户...");
                current++;
                sendmessage();
            }
        });
    }
</script>

<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>