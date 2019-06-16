<?php defined('IN_IA') or exit('Access Denied');?><div class="col-sm-12">
    <div class="tabs-container">
        <ul class="nav nav-tabs">
            <li class="active" style="width: auto">
                <a data-toggle="tab" href="#tab-sale-1" aria-expanded="false">
                    促销方式
                </a>
            </li>
            <li style="width: auto">
                <a data-toggle="tab" href="#tab-sale-2" aria-expanded="true">
                    满返设置
                </a>
            </li>


            <li style="width: auto">
                <a data-toggle="tab" href="#tab-sale-3" aria-expanded="true">
                    抵扣设置
                </a>
            </li>
    

            <li style="width: auto">
                <a data-toggle="tab" href="#tab-sale-4" aria-expanded="true">
                    包邮条件
                </a>
            </li>
            <!--
            <li style="width: auto">
                <a data-toggle="tab" href="#tab-sale-5" aria-expanded="true">
                    购物送优惠卷
                </a>
            </li>
            -->
            <li style="width: auto">
                <a data-toggle="tab" href="#tab-sale-6" aria-expanded="true">
                    重复购买
                </a>
            </li>
        </ul>
        <div class="tab-content">
            <div id="tab-sale-1" class="tab-pane active">
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        促销方式
                    </label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if( ce('goods' ,$item) ) { ?>
                        <label for="isdiscount" class="checkbox-inline">
                            <input type="checkbox" name="isdiscount" value="1" id="isdiscount" <?php  if($item['isdiscount']==1 ) { ?>checked="true" <?php  } ?> onclick="showDiscount(this)"/>
                            促销
                        </label>
                        <label for="istime" class="checkbox-inline">
                            <input type="checkbox" name="istime" value="1" id="istime" <?php  if($item['istime']==1 ) { ?>checked="true" <?php  } ?> onclick="showTime(this)" />
                            限时卖
                        </label>
                        <?php  } else { ?>
                        <div class='form-control-static'>
                            <?php  if($item['isdiscount']==1) { ?>促销 <?php  } ?> <?php  if($item['istime']==1) { ?>限时卖<?php  } ?>
                        </div>
                        <?php  } ?>
                    </div>
                </div>

                <div id="timediv" class="form-group" <?php  if($item['istime']!=1) { ?>style="display:none"
                <?php  } ?>>
                <label class="col-sm-2 control-label">
                    限时卖时间
                </label>
                <?php if( ce('goods' ,$item) ) { ?>
                <div class="col-sm-4 col-xs-6">
                    <?php  echo tpl_form_field_daterange('saletime', array('starttime'=>date('Y-m-d H:i', $item['timestart']),'endtime'=>date('Y-m-d H:i', $item['timeend'])),true);?>
                </div>
                <?php  } else { ?>
                <div class="col-sm-6 col-xs-6">
                    <div class='form-control-static'>
                        <?php  if($item['istime']==1) { ?> <?php  echo date('Y-m-d H:i',$item['timestart'])?> - <?php  echo date('Y-m-d H:i',$item['timeend'])?> <?php  } ?>
                    </div>
                </div>
                <?php  } ?>
            </div>
            <div id="isdiscount_time" class="form-group" <?php  if($item['isdiscount']!=1) { ?>style="display:none"
            <?php  } ?>>
            <label class="col-sm-2 control-label">
                促销标题
            </label>
            <div class="col-sm-9 col-xs-12">
                <?php if( ce('goods' ,$item) ) { ?>
                <div class="input-group">
                    <input type="text" name="isdiscount_title" maxlength="5" class="form-control"
                           value="<?php  echo $item['isdiscount_title'];?>" />
                    <p class="help-block">
                        例如 : 季末清仓,双十一促销,品牌日 还可以输入
                        <span id="textCount">
                                    5
                                </span>
                        个字,不输入默认促销
                    </p>
                </div>
                <?php  } else { ?>
                <div class='form-control-static'>
                    <?php  echo $item['isdiscount_title'];?> 分
                </div>
                <?php  } ?>
            </div>
            <label class="col-sm-2 control-label">
                促销开始时间
            </label>
            <?php if( ce('goods' ,$item) ) { ?>
            <div class="col-sm-4 col-xs-6">
                <?php echo tpl_form_field_date('discount_fromtime', !empty($item['discount_fromtime']) ? date('Y-m-d H:i',$item['discount_fromtime']) : date('Y-m-d H:i'),true)?>
            </div>
            <?php  } else { ?>
            <div class="col-sm-4 col-xs-6">
                <div class='form-control-static'>
                    <?php  if($item['isdiscount_time']==1) { ?> <?php  echo date('Y-m-d H:i',$item['discount_fromtime'])?>}<?php  } ?>
                </div>
            </div>
            <?php  } ?>
            <label class="col-sm-2 control-label">
                促销结束时间
            </label>
            <?php if( ce('goods' ,$item) ) { ?>
            <div class="col-sm-4 col-xs-6">
                <?php echo tpl_form_field_date('discount_totime', !empty($item['discount_totime']) ? date('Y-m-d H:i',$item['discount_totime']) : date('Y-m-d H:i'),true)?>
            </div>
            <?php  } else { ?>
            <div class="col-sm-4 col-xs-6">
                <div class='form-control-static'>
                    <?php  if($item['isdiscount_time']==1) { ?> <?php  echo date('Y-m-d H:i',$item['discount_totime'])?>}<?php  } ?>
                </div>
            </div>
            <?php  } ?>
        </div>


        <div id="saletype" class="form-group" <?php  if($item['isdiscount']!=1) { ?>style="display:none"<?php  } ?>>
        <?php  if($merchid > 0) { ?>
        <label class="col-sm-2 control-label">
            手机端使用的价格
        </label>
        <div class="col-sm-9 col-xs-12">
            <?php if( ce('goods' ,$item) ) { ?>
            <label class="radio-inline"><input type="radio" name="merchsale" value="0" <?php  if(empty($item['merchsale'])) { ?>checked="true"<?php  } ?>/> 当前设置的促销价格</label>
            <label class="radio-inline"><input type="radio" name="merchsale" value="1" <?php  if($item['merchsale'] == 1) { ?>checked="true"<?php  } ?>   /> 商户设置的促销价格</label>
            <span class="help-block"></span>
            <?php  } else { ?>
            <div class='form-control-static'><?php  if(empty($item['merchsale'])) { ?>当前设置的促销价格<?php  } else { ?>商户设置的促销价格<?php  } ?></div>
            <?php  } ?>
        </div>
        <?php  } ?>
    </div>


    <div id="isdiscount_true">
        <div id="isdiscount_discounts_1">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label">促销优惠方式</label>
            <div class="col-sm-6 col-xs-6">
                <?php if( ce('goods.goods' ,$item) ) { ?>
                <select name="discount_type" id="discount_type" style="width:200px"> 
                    <option value="0">请选择</option>
                    <option value="1" <?php  if($item['discount_type'] == 1) { ?>selected<?php  } ?>>直降</option>
                    <option value="2" <?php  if($item['discount_type'] == 2) { ?>selected<?php  } ?>>折扣</option>
                </select> 
                <label id="type1" <?php  if($item['discount_type'] != 1) { ?>class="hidden control-label"<?php  } else { ?>class="control-label"<?php  } ?>><input type="text" name="discount_price" id="discount_price" value="<?php  echo $item['discount_price'];?>" /> 元</label>
                <label id="type2" <?php  if($item['discount_type'] != 2) { ?>class="hidden control-label"<?php  } else { ?>class="control-label"<?php  } ?>><input type="text" name="discount_per" id="discount_per" value="<?php  echo $item['discount_per'];?>" /> %</label>
                <span class="help-block">直降: 优惠价 = 原价 - 直降价格，折扣：优惠价 = 原价 * 折扣比例 </span>
                <!--<div class='input-group'><input type="checkbox" name="discount_and_memprice" value="1" <?php  if($item['discount_and_memprice']) { ?>checked<?php  } ?>> 与会员折扣共同生效</div>
                <span class="help-block">如果勾选，商品将在会员折扣价基础上进行优惠(折上折)；如果不勾选，以会员价和促销价中的最低价为准</span>-->
                  <?php  } else { ?>
                   <div class='form-control-static'><?php  if($item['discount_type'] == 1) { ?>直降<?php  echo $item['discount_price'];?>元<?php  } else if($item['discount_type'] == 2) { ?>折扣<?php  echo $item['discount_per'];?>%<?php  } ?></div>
                <?php  } ?>
            </div>
        </div>
    </div>
</div>
<div id="tab-sale-2" class="tab-pane">
    <div class="form-group">
        <label class="col-sm-2 control-label">
            积分赠送
        </label>
        <div class="col-sm-9 col-xs-12">
            <?php if( ce('goods' ,$item) ) { ?>
            <div class="input-group">
                <input type="text" name="credit" id="credit" class="form-control" value="<?php  echo $item['credit'];?>"/>
                <span class="input-group-addon">
                                分
                            </span>
            </div>
            <p class="help-block">
                会员购物赠送的积分, 如果不填写或填写0，则默认为不赠送积分，如果带%则为按成交价格的比例计算积分
            </p>
            <p class="help-block">
                如: 购买2件，设置10 积分, 不管成交价格是多少， 则购买后获得20积分
            </p>
            <p class="help-block">
                如: 购买2件，设置10%积分, 成交价格2 * 200= 400， 则购买后获得 40 积分（400*10%）
            </p>
            <?php  } else { ?>
            <div class='form-control-static'>
                <?php  echo $item['credit'];?> 分
            </div>
            <?php  } ?>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">
            余额返现
        </label>
        <div class="col-sm-9 col-xs-12">
            <?php if( ce('goods' ,$item) ) { ?>
            <div class="input-group">
                <input type="text" name="money" id="money" class="form-control" value="<?php  echo $item['money'];?>"
                />
                <span class="input-group-addon">
                                元
                            </span>
            </div>
            <p class="help-block">
                会员购物返现, 如果不填写或填写0，则默认为不返现，如果带%则为按成交价格的比例计算返现
            </p>
            <p class="help-block">
                如: 购买2件，设置10 元, 不管成交价格是多少， 则购买后获得20元返现
            </p>
            <p class="help-block">
                如: 购买2件，设置10%元, 成交价格2 * 200= 400， 则购买后获得 40 元返现（400*10%）
            </p>
            <?php  } else { ?>
            <div class='form-control-static'>
                <?php  echo $item['credit'];?> 分
            </div>
            <?php  } ?>
        </div>
    </div>
</div>

<div id="tab-sale-3" class="tab-pane">
    <div class="form-group">
        <label class="col-sm-2 control-label">
            积分抵扣
        </label>
        <div class="col-sm-9 col-xs-12">
            <?php if( ce('goods' ,$item) ) { ?>
            <div class='input-group'>
                            <span class="input-group-addon">
                                最多抵扣
                            </span>
                <input type="text" name="deduct" value="<?php  echo $item['deduct'];?>" class="form-control"/>
                <span class="input-group-addon">
                                元
                            </span>
            </div>
            <label class="checkbox-inline" for="manydeduct">
                <input id="manydeduct" type="checkbox" <?php  if($item['manydeduct']==1 ) { ?>checked="true"<?php  } ?> value="1" name="manydeduct">
                允许多件累计抵扣
            </label>
            <span class="help-block">
                            如果设置0，则不支持积分抵扣
                        </span>
            <?php  } else { ?>
            <div class='form-control-static'>
                <?php  if(empty($item['deduct'])) { ?>不支持积分抵扣<?php  } else { ?>最多抵扣 <?php  echo $item['deduct'];?> 元 <?php  if(empty($item['manydeduct'])) { ?>不允许多件累计抵扣<?php  } else { ?>允许多件累计抵扣
                <?php  } ?><?php  } ?>
            </div>
            <?php  } ?>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">
            余额抵扣
        </label>
        <div class="col-sm-9 col-xs-12">
            <?php if( ce('goods' ,$item) ) { ?>
            <div class='input-group'>
                            <span class="input-group-addon">
                                最多抵扣
                            </span>
                <input type="text" name="deduct2" value="<?php  echo $item['deduct2'];?>" class="form-control"
                />
                            <span class="input-group-addon">
                                元
                            </span>
            </div>
                        <span class="help-block">
                            如果设置0，则支持全额抵扣，设置-1 不支持余额抵扣
                        </span>
            <?php  } else { ?>
            <div class='form-control-static'>
                <?php  if(empty($item['deduct2'])) { ?> 支持全额抵扣 <?php  } else if($item['deduct2']==-1) { ?> 不支持余额抵扣<?php  } else { ?> 最多抵扣 <?php  echo $item['deduct2'];?> 元 <?php  } ?>
            </div>
            <?php  } ?>
        </div>
    </div>

</div>


<div id="tab-sale-4" class="tab-pane">
    <div class="form-group">
        <label class="col-sm-2 control-label">单品满件包邮</label>
        <div class="col-sm-4">
            <?php if( ce('goods' ,$item) ) { ?>
            <div class='input-group'>
                <span class="input-group-addon">满</span>
                <input type="text" name="ednum" value="<?php  echo $item['ednum'];?>" class="form-control"/>
                <span class="input-group-addon">件</span>
            </div>
            <span class="help-block">如果设置0或空，则不支持满件包邮</span>
            <?php  } else { ?>
            <div class='form-control-static'><?php  if(empty($item['ednum'])) { ?>不支持满件包邮<?php  } else { ?>支持 <?php  } ?></div>
            <?php  } ?>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">单品满额包邮</label>
        <div class="col-sm-4">
            <?php if( ce('goods' ,$item) ) { ?>
            <div class='input-group'>
                <span class="input-group-addon">满</span>
                <input type="text" name="edmoney" value="<?php  echo $item['edmoney'];?>" class="form-control"/>
                <span class="input-group-addon">元</span>
            </div>
            <span class="help-block">如果设置0或空，则不支持满额包邮</span>
            <?php  } else { ?>
            <div class='form-control-static'><?php  if(empty($item['edmoney'])) { ?>不支持满额包邮<?php  } else { ?>支持 <?php  } ?></div>
            <?php  } ?>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">不参与单品包邮地区</label>
        <div class="col-sm-9 col-xs-12">
            <?php if( ce('goods' ,$item) ) { ?>
            <div id="areas" class="form-control-static"><?php  echo $item['edareas'];?></div>
            <a href="javascript:;" class="btn btn-default" onclick="selectAreas()">添加不参加满包邮的地区</a>
            <input type="hidden" id='selectedareas' name="edareas" value="<?php  echo $item['edareas'];?>"/>
            <span class="help-block">如果设置0或空，则不支持满件包邮</span>
            <?php  } else { ?>
            <div class='form-control-static'><?php  echo $set['enoughareas'];?></div>
            <?php  } ?>
        </div>
    </div>
</div>

<div id="tab-sale-6" class="tab-pane"><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('goods/tab/repeat', TEMPLATE_INCLUDEPATH)) : (include template('goods/tab/repeat', TEMPLATE_INCLUDEPATH));?></div>

</div>
</div>
</div>
<script>
    <?php if( ce('goods' ,$item) ) { ?>
    $(document).ready(function() {
        var Discount = document.getElementById("isdiscount");
		
		$('#discount_type').change(function(){
			$('#discount_price, #discount_per').val('');
			if ($(this).val() == '0')
			{
				$('#type1, #type2').addClass('hidden');
			}
			else if($(this).val() == '1')
			{
				$('#type1').removeClass('hidden');
				$('#type2').addClass('hidden');
			}
			else if($(this).val() == '2')
			{
				$('#type1').addClass('hidden');
				$('#type2').removeClass('hidden');
			}
		});

        showDiscount(Discount);
    });
    function showTime(obj) {
        if (obj.checked) {
            $('#timediv').show();
            $('#isdiscount_time').hide();
            $('input[name="isdiscount"]').removeAttr('checked');
            $('#isdiscount_true').hide();
        } else {
            $('#timediv').hide();
        }
    }
    function showDiscount(obj) {
        if (obj.checked) {
            $('input[name="istime"]').removeAttr('checked');
            $('#timediv').hide();
            $('#isdiscount_time').show();
            $('#isdiscount_true').show();
            $('#saletype').show();
        } else {
            $('#isdiscount_time').hide();
            $('#isdiscount_true').hide();
            $('#saletype').hide();
        }
    }
    <?php  } ?>
    function isdiscount_change() {
        var html = '<table class="table table-bordered table-condensed"><thead><tr class="active"><?php  if(is_array($levels)) { foreach($levels as $level) { ?><th><div class=""><div style="padding-bottom:10px;text-align:center;"><?php  echo $level["levelname"];?></div></div></th><?php  } } ?></tr></thead><tbody><tr><?php  if(is_array($levels)) { foreach($levels as $level) { ?><?php  if($level["key"]=="default") { ?><td><input name="isdiscount_discounts_level_<?php  echo $level["key"];?>_default" type="text" class="form-control isdiscount_discounts_<?php  echo $level["key"];?> isdiscount_discounts_<?php  echo $level["key"];?>_default" value="<?php echo is_array($isdiscount_discounts[$level["key"]]["option0"]) ? '' : $isdiscount_discounts[$level["key"]]["option0"];?>" placeholder="会员促销价格单位: 元"></td><?php  } else { ?><td><input name="isdiscount_discounts_level_<?php  echo $level["id"];?>_default" type="text" class="form-control isdiscount_discounts_level<?php  echo $level["id"];?> isdiscount_discounts_level<?php  echo $level["id"];?>_default" value="<?php echo is_array($isdiscount_discounts["level".$level["id"]]["option0"]) ? '' : $isdiscount_discounts["level".$level["id"]]["option0"];?>" placeholder="会员促销价格单位: 元"></td><?php  } ?><?php  } } ?></tr></tbody></table>';
        if ($("#isdiscount_discounts").html()=='')
        {
            $("#isdiscount_discounts_default").html(html);
        }
        else
        {
            $("#isdiscount_discounts_default").html('');
        }
    }

    isdiscount_change();
    <?php if( ce('goods' ,$item) ) { ?>
    <?php  } ?>
</script>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('shop/selectareas', TEMPLATE_INCLUDEPATH)) : (include template('shop/selectareas', TEMPLATE_INCLUDEPATH));?>