<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>

 <div class="page-heading"><h2>数据清理 </h2></div>

    <form id="dataform" action="" method="post" class="form-horizontal form-validate">

                <div class="form-group">
                    <label class="col-sm-2 control-label must">选择公众号</label>
                    <div class="col-sm-9">
						<select id='wechatid' name='wechatid' class='form-control select2' data-rule-required='true' >
							<option value=''></option>
							<?php  if(is_array($wechats)) { foreach($wechats as $we) { ?>	
							<option value='<?php  echo $we['uniacid'];?>'><?php  echo $we['name'] ?></option>
							<?php  } } ?>
							<option value='-1'>全部公众号</option>
						</select>
                    </div>
                </div>
				<div class="form-group">
                    <label class="col-sm-2 control-label">
			    <label>
				 <input type='checkbox' class="checkline-all" value="shop"  /> 商城数据
			    </label>	
						
					</label>
                    <div class="col-sm-9">
			 <label class="checkbox-inline">
							<input type='checkbox' value="goods" name="shop[]" /> 商品
						</label>
						 <label class="checkbox-inline">
							<input type='checkbox' value="category" name="shop[]" /> 商品分类
						</label>
						<label class="checkbox-inline">
								<input type='checkbox' value="dispatch" name="shop[]" /> 配送方式
							</label>
							<label class="checkbox-inline">
								<input type='checkbox' value="adv" name="shop[]" /> 幻灯片
							</label> 
						         <label class="checkbox-inline">
								<input type='checkbox' value="notice" name="shop[]" /> 公告
							</label>
						 
							<label class="checkbox-inline">
								<input type='checkbox' value="level" name="shop[]" /> 会员等级
							</label>
							<label class="checkbox-inline">
								<input type='checkbox' value="group" name="shop[]" /> 会员分组
							</label>
						 
							
							
						</div>
						
                    </div>
				
					<div class="form-group">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-9">
			 
							<label class="checkbox-inline">
								<input type='checkbox' value="member" name="shop[]" /> 会员数据
							</label>
						       <label class="checkbox-inline">
								<input type='checkbox' value="memberlevel" name="shop[]" /> 会员等级(清除所有会员的会员等级)
						       </label>	
						     <label class="checkbox-inline">
								<input type='checkbox' value="membergroup" name="shop[]" /> 会员分组(清除所有会员的会员分组)
						       </label>	
						      <label class="checkbox-inline">
								<input type='checkbox' value="membercredit1" name="shop[]" /> 会员积分(清除所有会员的积分)
						       </label>	
						<label class="checkbox-inline">
								<input type='checkbox' value="membercredit2" name="shop[]" /> 会员余额(清除所有会员的余额)
						       </label>	
						 <label class="checkbox-inline">
								<input type='checkbox' value="order" name="shop[]" /> 订单数据
							</label>
							
						</div>
						
                    </div>
   				
	    <div class="form-group">
                    <label class="col-sm-2 control-label">   <label>
				 <input type='checkbox'  class="checkline-all" value="commission" /> 人人分销
			    </label>	</label>
                    <div class="col-sm-9">
			    <label class="checkbox-inline">
				 <input type='checkbox' value="agent" name="commission[]" /> 分销商资格(清除所有会员的分销商资格)
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="relation" name="commission[]" /> 上下级关系(清除所有会员的上下级)
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="agentlevel" name="commission[]" /> 分销商等级(清除所有会员的分销商等级)
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="level" name="commission[]" /> 分销商等级
			    </label>	
			     <label class="checkbox-inline">
				 <input type='checkbox' value="apply" name="commission[]" /> 提现申请
			    </label>	
		   </div>
	    </div>	
				
				  <div class="form-group">
                    <label class="col-sm-2 control-label"> <label>
				 <input type='checkbox'  class="checkline-all" value="poster" /> 超级海报
			    </label></label>
                    <div class="col-sm-9">
			   <label class="checkbox-inline">
				 <input type='checkbox' value="poster" name="poster[]" /> 海报数据
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="cache" name="poster[]" /> 海报缓存
			    </label>	
			     <label class="checkbox-inline">
				 <input type='checkbox' value="log" name="poster[]" /> 关注记录
			    </label>	
			     <label class="checkbox-inline">
				 <input type='checkbox' value="scan" name="poster[]" /> 扫描记录
			    </label>	
		 
			 </div>
	    </div>	
				
				
	        <div class="form-group">
                    <label class="col-sm-2 control-label"><label>
				 <input type='checkbox'  class="checkline-all" value="verify" /> O2O核销
			    </label></label>
                    <div class="col-sm-9">
			   <label class="checkbox-inline">
				 <input type='checkbox' value="store" name="verify[]" /> 门店
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="saler" name="verify[]" /> 核销员
			    </label>	
			 </div>
	    </div>
				<div class="form-group">
                    <label class="col-sm-2 control-label">
						<label>
				 <input type='checkbox'  class="checkline-all" value="perm"  /> 分权系统
			    </label></label>
                    <div class="col-sm-9">
			<label class="checkbox-inline">
				 <input type='checkbox' value="role" name="perm[]" /> 角色
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="user" name="perm[]" /> 操作员
			    </label>	
			     <label class="checkbox-inline">
				 <input type='checkbox' value="log" name="perm[]" /> 操作日志
			    </label>	
			</div>
	    </div>		
 
             <div class="form-group">
                    <label class="col-sm-2 control-label"><label>
				 <input type='checkbox'  class="checkline-all" value="creditshop" /> 积分商城
			    </label></label>
                    <div class="col-sm-9">
			   <label class="checkbox-inline">
				 <input type='checkbox' value="goods" name="creditshop[]" /> 商品
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="category" name="creditshop[]" /> 分类
			    </label>	
						 <label class="checkbox-inline">
				 <input type='checkbox' value="adv" name="creditshop[]" /> 幻灯片
			    </label>	
                                   <label class="checkbox-inline">
				 <input type='checkbox' value="log" name="creditshop[]" /> 兑换抽奖记录
			    </label>	
			 </div>
	    </div>
				 <div class="form-group">
                    <label class="col-sm-2 control-label"><label>
				 <input type='checkbox'  class="checkline-all" value="virtual" /> 虚拟物品
			    </label></label>
                    <div class="col-sm-9">
			    <label class="checkbox-inline">
				 <input type='checkbox' value="template" name="virtual[]" /> 模板
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="category" name="virtual[]" /> 分类
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="data" name="virtual[]" /> 模板数据
			    </label>	
			 </div>
	    </div>
		<?php  if(p('designer')) { ?>
		
				 <div class="form-group">
                    <label class="col-sm-2 control-label"><label>
				 <input type='checkbox'  class="checkline-all" value="designer"  /> 店铺装修
			    </label></label>
                    <div class="col-sm-9">
			    <label class="checkbox-inline">
				 <input type='checkbox' value="page" name="designer[]" /> 页面
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="menu" name="designer[]" /> 自定义菜单
			    </label>	
			 
			 </div>
	    </div>
		
		<?php  } ?>
		
		<?php  if(p('article')) { ?>
		
				 <div class="form-group">
                    <label class="col-sm-2 control-label"><label>
				 <input type='checkbox'  class="checkline-all" value="article"  /> 文章营销
			    </label></label>
                    <div class="col-sm-9">
			    <label class="checkbox-inline">
				 <input type='checkbox' value="article" name="article[]" /> 文章
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="category" name="article[]" /> 分类
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="share" name="article[]" /> 分享记录
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="log" name="article[]" /> 浏览点赞记录
			    </label>	
			   <label class="checkbox-inline">
				 <input type='checkbox' value="report" name="article[]" /> 举报记录
			    </label>	
			 </div>
	    </div>
		
		<?php  } ?>
		<?php  if(com('coupon')) { ?>
		 <div class="form-group">
                    <label class="col-sm-2 control-label"><label>
				 <input type='checkbox'  class="checkline-all" value="coupon"  /> 超级券
			    </label></label>
                    <div class="col-sm-9">
			    <label class="checkbox-inline">
				 <input type='checkbox' value="coupon" name="coupon[]" /> 优惠券
			    </label>	
						 <label class="checkbox-inline">
				 <input type='checkbox' value="category" name="coupon[]" /> 优惠券分类
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="data" name="coupon[]" /> 用户数据
			    </label>	
			 </div>
	    </div>
		<?php  } ?>
 		
				  <div class="form-group">
                    <label class="col-sm-2 control-label"><label>
				 <input type='checkbox'  class="checkline-all" value="postera" /> 活动海报
			    </label></label>
                    <div class="col-sm-9">
			   <label class="checkbox-inline">
				 <input type='checkbox' value="poster" name="postera[]" /> 海报海报
			    </label>	
			    <label class="checkbox-inline">
				 <input type='checkbox' value="cache" name="postera[]" /> 海报缓存
			    </label>	
			     <label class="checkbox-inline">
				 <input type='checkbox' value="log" name="postera[]" /> 关注记录
			    </label>	
			 </div>
	    </div>	
				<div class="form-group">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-9">
						<input  type="submit" value="立即清除" class="btn btn-primary" data-confirm='操作后不可撤销，是否继续？' />
						
                    </div>
                </div>	


<script type="text/javascript">

	$(function () {

		$('.checkline-all').click(function(){
			var checked  =$(this).get(0).checked;
			 
			var name = $(this).val();
			$(":checkbox[name='" + name+ "[]']").each(function(){
				$(this).get(0).checked = checked;
			})
		})
	})

	$('form').submit(function(){

		if ($("#wechatid").val() == '') {
			tip.msgbox.err("请选择要清除的公众号!");
			$('form').attr('stop',1);
			return false;
		}
		
		$('form').removeAttr('stop');
		return true;
		
	});
 
</script>

<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>
