<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<script src="./resource/js/lib/jquery-1.11.1.min.js"></script>
<script src="<?php  echo EWEI_SHOPV2_LOCAL?>static/js/dist/jquery/jqprint.js"></script>
<script src="<?php  echo EWEI_SHOPV2_LOCAL?>static/js/dist/jquery/jquery.migrate.js"></script>
<div class="page-heading"> <h2>对账单打印</h2> </div>
<form action="./index.php" method="get" class="form-horizontal" role="form" id="form1">
    <input type="hidden" name="c" value="site" />
    <input type="hidden" name="a" value="entry" />
    <input type="hidden" name="m" value="ewei_shopv2" />
    <input type="hidden" name="do" value="web" />
    <input type="hidden" name="r" value="finance.log.printer" />
	  <div class="page-toolbar row" id='moresearch' >
        <div class='col-sm-4' style='padding-right:0'>
            <?php  echo tpl_daterange('time', array('sm'=>true,'placeholder'=>'对账时间'),true);?>
        </div>
        <div class="col-sm-8 pull-right">
            <div class="input-group " >
                <span class="input-group-btn">
                <button class="btn btn-sm btn-primary" type="submit"> 搜索</button>  
            </span>
            </div>

        </div>
    </div>
</form>
	<div id="print-con">
	<div class="tinyprinter" <?php  if($printset['mem_width'] > 0) { ?>style="width:<?php  echo $printset['mem_width'];?>px;"<?php  } ?>>
    	<h1>对账单</h1>
        <h4>打印时间：<?php  echo date('Y-m-d H:i:s', time())?></h4>
        <h4>统计时间：<?php  if($starttime > 0) { ?><?php  echo date('Y-m-d H:i', $starttime)?><?php  } ?> 到 <?php  if($endtime > 0) { ?><?php  echo date('Y-m-d H:i', $endtime)?><?php  } ?></h4>
        <span class="blank"></span>
    	<div class="section2" <?php  if($printset['mem_fontsize'] > 0) { ?>style="font-size:<?php  echo $printset['mem_fontsize'];?>px;"<?php  } ?>>
            <li>线下充值总额：<span><?php  echo $data['recharge'];?></span></li>
            <li>【方式】银行卡：<span><?php  echo $data['recharges']['bankcard'];?></span></li>
            <li>【方式】现金：<span><?php  echo $data['recharges']['cash'];?></span></li>
            <li>【方式】支付宝：<span><?php  echo $data['recharges']['alipay'];?></span></li>
            <li>【方式】微信：<span><?php  echo $data['recharges']['wechat'];?></span></li>
        </div>
        <span class="blank"></span>
        <div class="section2" <?php  if($printset['mem_fontsize'] > 0) { ?>style="font-size:<?php  echo $printset['mem_fontsize'];?>px;"<?php  } ?>>
            <li>线上充值金额：<span><?php  echo $data['recharge_xcx'];?></span></li>
        </div>
        <span class="blank"></span>
        <div class="section2" <?php  if($printset['mem_fontsize'] > 0) { ?>style="font-size:<?php  echo $printset['mem_fontsize'];?>px;"<?php  } ?>>
            <li>储值扣款金额：<span><?php  echo $data['credit2_pay'];?></span></li>
        </div>
        <span class="blank"></span>
        <div class="section2" <?php  if($printset['mem_fontsize'] > 0) { ?>style="font-size:<?php  echo $printset['mem_fontsize'];?>px;"<?php  } ?>>
            <li>返现金额：<span><?php  echo $data['commission'];?></span></li>
        </div>
        <!--<div class="section2" <?php  if($printset['mem_fontsize'] > 0) { ?>style="font-size:<?php  echo $printset['mem_fontsize'];?>px;"<?php  } ?>>
            <li>线下消费总额：<span><?php  echo $data['offline_pay'];?></span></li>
            <li>【方式】银行卡：<span><?php  echo $data['offlines']['bankcard'];?></span></li>
            <li>【方式】现金：<span><?php  echo $data['offlines']['cash'];?></span></li>
            <li>【方式】支付宝：<span><?php  echo $data['offlines']['alipay'];?></span></li>
            <li>【方式】微信：<span><?php  echo $data['offlines']['wechat'];?></span></li>
        </div>-->
        <span class="blank"></span>
        <div class="section2" <?php  if($printset['mem_fontsize'] > 0) { ?>style="font-size:<?php  echo $printset['mem_fontsize'];?>px;"<?php  } ?>>
            <li>订单金额：<span><?php  echo $data['order'];?></span></li>
        </div>
    </div>
    </div>
	<div class="form-group"></div>
    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-9 col-xs-12">
           
            <input type="button" value="打印" class="btn btn-primary print"  />
            <input type="button" name="back" onclick="location.href='<?php  echo webUrl('member/recharge')?>'" style='margin-left:10px;' value="放弃" class="btn btn-default" />
        </div>
    </div>

<script language='javascript'>
    $(function(){
        $('.print').click(function(){
			$('#print-con').jqprint();
		});

    });
	
</script>
</form>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>

