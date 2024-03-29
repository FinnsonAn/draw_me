<?php defined('IN_IA') or exit('Access Denied');?><div class="form-group">
    <label class="col-sm-2 control-label">推送标题</label>
    <div class="col-sm-9 col-xs-12">
        <input type="text" class="form-control" id="custitle" name="data[custitle]" value="<?php  echo $data['custitle'];?>" />
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">推送图片</label>
    <div class="col-sm-9 col-xs-12">
        <?php  echo tpl_form_field_image('custhumb', $data['custhumb'])?>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">推送描述</label>
    <div class="col-sm-9 col-xs-12">
        <textarea id="cusdesc" name="cusdesc" class="form-control" ><?php  echo $data['cusdesc'];?></textarea>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">推送链接</label>
    <div class="col-sm-9 col-xs-12">

        <div class="input-group form-group" style="margin: 0;">
            <input type="text" name="cusurl" class="form-control" value="<?php  echo $data['cusurl'];?>" id="cusurl" />
            <span data-input="#cusurl" data-toggle="selectUrl" data-full="true" class="input-group-addon btn btn-default">选择链接</span>
        </div>
        <span class='help-block'>消息推送点击的链接，为空默认为优惠券详情</span>

    </div>
</div>