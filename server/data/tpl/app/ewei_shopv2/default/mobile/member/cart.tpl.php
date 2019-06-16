<?php defined('IN_IA') or exit('Access Denied');?>
<?php (!empty($this) && $this instanceof WeModuleSite) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<div class='fui-page  fui-page-current member-cart-page'>
	<div class="fui-header">
		<div class="fui-header-left">
			<a class="back"></a>
		</div>
		<div class="title">我的购物车</div>

		<div class="fui-header-right">
			<a class="btn-edit" style="display:none">编辑</a>
		</div>

	</div>
	<div class='fui-content navbar cart-list' style="bottom: 4.8rem">
		<div id="cart_container"></div>
	</div>

	<div id="footer_container"></div>

	<?php  $this->footerMenus()?>
</div>


<script type="text/html" id="tpl_member_cart">
		<div class='content-empty' <%if list.length>0%>style="display:none"<%/if%>>
			<i class='icon icon-cart'></i><br/>购物车空空如也~<br/><a href="<?php  echo mobileUrl()?>" class='btn btn-default-o external'>主人快去给我找点东西吧</a>
		</div>

		<%if list.length>0%>

		<div class="fui-list-group" id="container">

			<%each list as g%>
			<div class="fui-list goods-item align-start"
				 data-cartid="<%g.id%>"
				 data-goodsid="<%g.goodsid%>"
				 data-optionid="<%g.optionid%>"
				 data-seckill-maxbuy = "<%g.seckillmaxbuy%>"
				 data-seckill-selfcount = "<%g.seckillselfcount%>"
				 data-seckill-price = "<%g.seckillprice%>"
				 data-type = "<%g.type%>"
			>
				<div class="fui-list-media ">
					<input type="checkbox" name="checkbox" class="fui-radio fui-radio-danger cartmode check-item"<%if g.selected==1%>checked<%/if%>/>
					<input type="checkbox" name="checkbox" class="fui-radio fui-radio-danger editmode edit-item"/>
				</div>

				<div class="fui-list-media image-media">
					<a href="<?php  echo mobileUrl('goods/detail')?>&id=<%g.goodsid%>">
						<img id="gimg_<?php  echo $g['id'];?>" data-lazy="<%g.thumb%>" class="round">
					</a>
				</div>
				<div class="fui-list-inner">
					<a href="<?php  echo mobileUrl('goods/detail')?>&id=<%g.goodsid%>">
						<div class="text">
							<%if  g.type==4%>
							<span class='fui-label fui-label-danger'>批发</span>
							<%/if%>
							<%if  g.discounttype>0&& g.isnodiscount ==0%>
							<span class='fui-label fui-label-danger'>折扣</span>
							<%/if%>
							<%if g.seckillprice>0%>
							<div class="fui fui-label fui-label-danger"><%g.seckilltag%></div>
							<%/if%>
							<%g.title%>
						</div>
						<%if g.optionid%>
						<div class="text cart-option cartmode">
							<div class="choose-option"><%g.optiontitle%></div>
						</div>
						<%/if%>
					</a>
					<%if g.optionid%>
						<div class="text  cart-option  editmode">
							<div class="choose-option" data-optionid="<%g.optionid%>"><%g.optiontitle%></div>
						</div>
					<%/if%>
				</div>
				<div class='fui-list-angle'>
					<span class="price">￥<span class='marketprice'><%g.marketprice%></span></span>
					<%if g.type==4%>
					<div class="fui-number small "
						 data-value="<%g.total%>"
						 data-max="<%g.totalmaxbuy%>"
						 data-min="<%g.minbuy%>"
						 data-mintoast="<%g.minbuy%><%g.unit%>起批"
					>

					<%else%>
					<div class="fui-number small "
						 data-value="<%g.total%>"
						 data-max="<%g.totalmaxbuy%>"
						 data-min="<%g.minbuy%>"
						 data-maxtoast="最多购买{max}<%g.unit%>"
						 data-mintoast="{min}<%g.unit%>起售"
					>
					<%/if%>
						<div class="minus">-</div>
						<input class="num shownum" type="tel" name="" value="<%g.total%>"/>
						<div class="plus ">+</div>
					</div>

				</div>
			</div>
			<%/each%>

		</div>
	<%/if %>
</script>



<script type="text/html" id="tpl_member_cart_footer">

	<%if list.length>0%>

	<div class="fui-footer cartmode" style="bottom: 2.4rem">
		<div class="fui-list noclick">
			<div class="fui-list-media editmode">
				<label class="checkbox-inline editcheckall"><input type="checkbox" name="checkbox" class="fui-radio fui-radio-danger " />&nbsp;全选</label>
			</div>
			<div class="fui-list-media">
				<label class="checkbox-inline checkall"><input type="checkbox" name="checkbox"
															   class="fui-radio fui-radio-danger " <%if ischeckall%>checked<%/if%>/>&nbsp;全选</label>
			</div>
			<div class="fui-list-inner">
				<div class='subtitle'>合计：<span class="text-danger">￥</span><span class='text-danger totalprice'><%totalprice%></span></div>
				<div class='text'>不含运费</div>
			</div>
			<div class='fui-list-angle'>
				<div class="btn  btn-submit <%if total<=0%>}btn-default disabled<%else%>btn-danger<%/if%>" <%if total<=0%>stop="1"<%/if%>>结算(<span class='total'><%total%></span>)</div>
		</div>
	</div>
	</div>
	<div class="fui-footer editmode" style="bottom: 2.4rem">
		<div class="fui-list noclick">
			<div class="fui-list-media">
				<label class="checkbox-inline editcheckall"><input type="checkbox" name="checkbox" class="fui-radio fui-radio-danger " />&nbsp;全选</label>
			</div>
			<div class='fui-list-angle'>
				<div class="btn  btn-default-o btn-favorite disabled">移动到关注</div>
				<div class="btn  btn-danger-o btn-delete  disabled">删除</div>
			</div>
		</div>
	</div>

	<%/if %>

</script>

<?php (!empty($this) && $this instanceof WeModuleSite) ? (include $this->template('goods/picker', TEMPLATE_INCLUDEPATH)) : (include template('goods/picker', TEMPLATE_INCLUDEPATH));?>
<script language='javascript'>require(['biz/member/cart'], function (modal) {
	modal.init();
});</script>
</div>

<?php (!empty($this) && $this instanceof WeModuleSite) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>