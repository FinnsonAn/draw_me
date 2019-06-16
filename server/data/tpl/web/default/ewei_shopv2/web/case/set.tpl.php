<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<div class="page-heading">
    <h2>基础设置</h2>
</div>

<form id="setform"  action="" method="post" class="form-horizontal form-validate">
    <input type="hidden" id="tab" name="tab" value="<?php  echo $_GPC['tab'];?>" />
	<div class="form-group">
        <label class="col-sm-2 control-label">作品关键词</label>
        <div class="col-sm-9 col-xs-12">
            <?php if(cv('case.set.edit')) { ?>
            <input type="text" name="data[case]" class="form-control" value="<?php  echo $data['case'];?>" />
            <?php  } else { ?>
            <div class='form-control-static'><?php  echo $data['case'];?></div>
            <?php  } ?>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">作者关键词</label>
        <div class="col-sm-9 col-xs-12">
            <?php if(cv('case.set.edit')) { ?>
            <input type="text" name="data[author]" class="form-control" value="<?php  echo $data['author'];?>" />
            <?php  } else { ?>
            <div class='form-control-static'><?php  echo $data['author'];?></div>
            <?php  } ?>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-9">
            <?php if(cv('case.set.edit')) { ?>
            <input type="submit" value="提交" class="btn btn-primary"/>
            <?php  } ?>
        </div>
    </div>
</form>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>