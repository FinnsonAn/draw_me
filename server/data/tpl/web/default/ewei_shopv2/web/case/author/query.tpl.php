<?php defined('IN_IA') or exit('Access Denied');?><div style='max-height:500px;overflow:auto;min-width:550px;'>
<table class="table table-hover" style="min-width:550px;">
    <tbody>   
        <?php  if(is_array($ds)) { foreach($ds as $row) { ?>
        <tr>
            <td>ID: <?php  echo $row['id'];?></td>
            <td><?php  echo $row['name'];?></td>
            <td><?php  echo $row['mobile'];?></td>
            <td style="width:80px;"><a href="javascript:;" onclick='select_author(<?php  echo json_encode($row);?>)'>选择</a></td>
        </tr>
        <?php  } } ?>
        <?php  if(count($ds)<=0) { ?>
        <tr> 
            <td colspan='4' align='center'>未找到画师</td>
        </tr>
        <?php  } ?>
    </tbody>
</table>
    </div>