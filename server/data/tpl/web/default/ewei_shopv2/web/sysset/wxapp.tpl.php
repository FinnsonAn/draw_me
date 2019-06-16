<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>

<div class="page-heading"> <h2>商城设置</h2> </div>

    <form action="" method="post" class="form-horizontal form-validate" enctype="multipart/form-data" >
                <div class="form-group">
                    <label class="col-sm-2 control-label">小程序名称</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if(cv('system.wxapp.edit')) { ?>
                        	<input type="text" name="data[name]" class="form-control" value="<?php  echo $data['name'];?>" />
                        <?php  } else { ?>
	                        <input type="hidden" name="data[name]" value="<?php  echo $data['name'];?>"/>
	                        <div class='form-control-static'><?php  echo $data['name'];?></div>
                        <?php  } ?>

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">小程序LOGO</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if(cv('system.wxapp.edit')) { ?>
                        <?php  echo tpl_form_field_image('data[logo]', $data['logo'])?>
                        <span class='help-block'>正方型图片</span>
                        <?php  } else { ?>
                        <input type="hidden" name="data[logo]" value="<?php  echo $data['logo'];?>"/>
                        <?php  if(!empty($data['logo'])) { ?>
                        <a href='<?php  echo tomedia($data['logo'])?>' target='_blank'>
                           <img src="<?php  echo tomedia($data['logo'])?>" style='width:100px;border:1px solid #ccc;padding:1px' />
                        </a>
                        <?php  } ?>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">小程序账号</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if(cv('system.wxapp.edit')) { ?>
                        	<input type="text" name="data[account]" class="form-control" value="<?php  echo $data['account'];?>" />
                        <?php  } else { ?>
	                        <input type="hidden" name="data[account]" value="<?php  echo $data['account'];?>"/>
	                        <div class='form-control-static'><?php  echo $data['account'];?></div>
                        <?php  } ?>

                    </div>
                </div>
                 <div class="form-group">
                    <label class="col-sm-2 control-label">原始ID</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if(cv('system.wxapp.edit')) { ?>
                        	<input type="text" name="data[original]" class="form-control" value="<?php  echo $data['original'];?>" />
                        <?php  } else { ?>
	                        <input type="hidden" name="data[original]" value="<?php  echo $data['original'];?>"/>
	                        <div class='form-control-static'><?php  echo $data['original'];?></div>
                        <?php  } ?>

                    </div>
                </div>
                 <div class="form-group">
                    <label class="col-sm-2 control-label">AppId</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if(cv('system.wxapp.edit')) { ?>
                        	<input type="text" name="data[AppId]" class="form-control" value="<?php  echo $data['AppId'];?>" />
                        <?php  } else { ?>
	                        <input type="hidden" name="data[AppId]" value="<?php  echo $data['AppId'];?>"/>
	                        <div class='form-control-static'><?php  echo $data['AppId'];?></div>
                        <?php  } ?>

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">AppSecret</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if(cv('system.wxapp.edit')) { ?>
                        	<input type="text" name="data[AppSecret]" class="form-control" value="<?php  echo $data['AppSecret'];?>" />
                        <?php  } else { ?>
	                        <input type="hidden" name="data[AppSecret]" value="<?php  echo $data['AppSecret'];?>"/>
	                        <div class='form-control-static'><?php  echo $data['AppSecret'];?></div>
                        <?php  } ?>

                    </div>
                </div>
               <div class="form-group">
                    <label class="col-sm-2 control-label">正式版本</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if(cv('system.wxapp.edit')) { ?>
                        	<input type="text" name="data[version]" class="form-control" value="<?php  echo $data['version'];?>" />
                        <?php  } else { ?>
	                        <input type="hidden" name="data[version]" value="<?php  echo $data['version'];?>"/>
	                        <div class='form-control-static'><?php  echo $data['version'];?></div>
                        <?php  } ?>

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">测试版本</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if(cv('system.wxapp.edit')) { ?>
                        	<input type="text" name="data[beta_version]" class="form-control" value="<?php  echo $data['beta_version'];?>" />
                        <?php  } else { ?>
	                        <input type="hidden" name="data[beta_version]" value="<?php  echo $data['beta_version'];?>"/>
	                        <div class='form-control-static'><?php  echo $data['beta_version'];?></div>
                        <?php  } ?>

                    </div>
                </div>
            <div class="form-group">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-9 col-xs-12">
                           <?php if(cv('system.wxapp.edit')) { ?>
                            <input type="submit" value="提交" class="btn btn-primary"  />
                          <?php  } ?>
                     </div>
            </div>
    </form>
 
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>