<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<div class="page-heading">
	<span class='pull-right'>
		<a class="btn btn-default  btn-sm" href="<?php  echo webUrl('member/list')?>">返回列表</a>               
	</span>
	<h2>添加会员</h2> 
</div>

<form <?php  if('member.list') { ?>action="" method="post"<?php  } ?> class="form-horizontal form-validate" enctype="multipart/form-data">
    <div class="form-group">
        <label class="col-sm-2 control-label">会员等级</label>
        <div class="col-sm-9 col-xs-12">
            <?php if(cv('member.list.edit')) { ?>
            <select name='level' class='form-control'>
                <option value=''><?php echo empty($shop['levelname'])?'普通会员':$shop['levelname']?></option>
                <?php  if(is_array($levels)) { foreach($levels as $level) { ?>
                <option value='<?php  echo $level['id'];?>' ><?php  echo $level['levelname'];?></option>
                <?php  } } ?>
            </select>
            <?php  } ?>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">会员分组</label>
        <div class="col-sm-9 col-xs-12">
            <?php if(cv('member.list.edit')) { ?>
            <select name='groupid' class='form-control'>
                <option value=''>无分组</option>
                <?php  if(is_array($groups)) { foreach($groups as $group) { ?>
                <option value='<?php  echo $group['id'];?>'><?php  echo $group['groupname'];?></option>
                <?php  } } ?>
            </select>
            <?php  } ?>
        </div>
    </div>
    
    
    <div class="form-group">
        <label class="col-sm-2 control-label">真实姓名</label>
        <div class="col-sm-9 col-xs-12">
            <?php if(cv('member.list.edit')) { ?>
            <input type="text" name="realname" class="form-control" value=""  />
            <?php  } else { ?>
            <div class='form-control-static'><?php  echo $member['realname'];?></div>
            <?php  } ?>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">手机号</label>
        <div class="col-sm-9 col-xs-12">
            <?php if(cv('member.list.edit')) { ?>
            <input type="text" name="mobile" class="form-control" value=""   data-rule-required='true'  onblur="validateMobile($(this))"/>
            <?php  } else { ?>
            <div class='form-control-static'><?php  echo $member['mobile'];?></div>
            <?php  } ?>
        </div>
    </div>


    <div class="form-group"></div>
    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-9 col-xs-12">

            <input type="submit" value="提交" class="btn btn-primary"  />

            <input type="button" name="back" onclick='history.back()' <?php if(cv('member.level.add|member.level.edit')) { ?>style='margin-left:10px;'<?php  } ?> value="返回列表" class="btn btn-default" />
        </div>
    </div>


</form>
<script>
function validateMobile(obj)
{
	var mobile = obj.val();

}
</script>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>

