<?php defined('IN_IA') or exit('Access Denied');?>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">二维码</h4>
            </div>
            <div class="modal-body">



                <div class="form-group">
                <?php  if($qr['url']) { ?>
                	<img src='<?php  echo $qr['url'];?>' width="80%" height="auto"/>
                <?php  } else { ?>
                	<div>没有相关二维码</div>
                <?php  } ?>

            </div> <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
        </div>
        </div>
    </div>
