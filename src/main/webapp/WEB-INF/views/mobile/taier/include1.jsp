<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div class="half"></div>
<div class="dialog">
	<dl class="dia_dl">
		<dt>
			<img src="${ctxStatic}/taier/images/rengong.png" /><span
				class="closees">关闭</span>
		</dt>
		<dd>
			<ul>
				<c:forEach items="${customerServiceList }" var="customerService">
					<li style="display: table; width: 100%;"><span
						style="width: 40%; display: block; text-align: right; padding-right: 25px; float: left;">${customerService.name }</span>
						<div style="width: 59%; float: left;">
							<a style="text-align: center;"
								href="http://wpa.qq.com/msgrd?v=3&uin=${customerService.qq }&site=qq&menu=yes"
								target="_Blank">点击进入在线客服</a>
						</div></li>
				</c:forEach>

			</ul>
		</dd>
	</dl>
</div>


<script>
    $(function(){
        $(".ketan").click(function(){
            var length=document.documentElement.scrollTop+400;
            $(".dialog").show().css("top",length+"px");
            $(".half").show().css("height",$(document).height());
        })
        $(".closees").click(function(){$(".dialog").hide();$(".half").hide();});
    })
</script>