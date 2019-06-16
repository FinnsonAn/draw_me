<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>

<div class="page-heading"> <h2>小程序默认设置</h2> </div>
    <form action="" method="post" class="form-horizontal form-validate" enctype="multipart/form-data" >
           <table class="table table-responsive table-hover">
                <thead>
                <tr>
                    <th style="width:35%">功能</th>
                    <th>模板ID</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        订单发货通知
                    </td>
                    <td><input type="text" name="data[send]" class="form-control" value="<?php  echo $data['send'];?>" /></td>
                </tr>
                </tbody>
            </table>
            <div class="form-group">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-9 col-xs-12">
                           <?php if(cv('system.wxtmp.edit')) { ?>
                            <input type="submit" value="提交" class="btn btn-primary"  />
                          <?php  } ?>
                     </div>
            </div>
    </form>
 
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>