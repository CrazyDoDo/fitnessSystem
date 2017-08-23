	/*点击左边栏的子按钮*/
	$(".sider-nav-s li").click(function(e) {
		$(this).siblings().removeClass("active");
        $(this).addClass("active");	
		var url=$(this).attr("name");
		var title=$(this).children("a").text();
		//使用 'exists' 方法来判断 tab 是否已经存在，如果已存在则激活 tab。如果不存在则调用 'add' 方法来添加一个新的 tab 面板
		function addTab(title,url){
			if ($('.easyui-tabs1').tabs('exists', title)){
			$('.easyui-tabs1').tabs('select', title);
			} else {
		var content = "<div title="+title+" data-options='closable:false' style='padding:10px 5px 5px 10px;'>"
						+"<iframe class='page-iframe' src='"+url+"' frameborder='no'   border='no' width='100%' height='590px'  scrolling='auto'></iframe>"+
					  "</div>";						
			$('.easyui-tabs1').tabs('add',{
			 title:title,
			content:content,
			closable:true
			});
			}
		}	
		addTab(title,url);	
		  		  
    });
	
	/*点击菜单快捷键*/
	$(".pf-nav li").click(function(e) {
		var url=$(this).attr("name");
		var title=$(this).children(".pf-nav-title").text();
		//使用 'exists' 方法来判断 tab 是否已经存在，如果已存在则激活 tab。如果不存在则调用 'add' 方法来添加一个新的 tab 面板
		function addTab(title,url){
			if ($('.easyui-tabs1').tabs('exists', title)){
			$('.easyui-tabs1').tabs('select', title);
			} else {
		var content = "<div title="+title+" data-options='closable:false' style='padding:10px 5px 5px 10px;'>"
						+"<iframe class='page-iframe' src='"+url+"' frameborder='no'   border='no' width='100%' height='590px'  scrolling='auto'></iframe>"+
					  "</div>";						
			$('.easyui-tabs1').tabs('add',{
			 title:title,
			content:content,
			closable:true
			});
			}
		}	
		addTab(title,url);	
		  		  
    });	
	
	/*中间内容的切换,tabs切换刷新页面*/
    $('.easyui-tabs1').tabs({
     /* onSelect:function(title,index){
        var currentTab = $('.easyui-tabs1').tabs("getSelected");
        if(currentTab.find("iframe") && currentTab.find("iframe").size()){
            currentTab.find("iframe").attr("src",currentTab.find("iframe").attr("src"));
        }
      }*/
    })
    $(window).resize(function(){
          $('.tabs-panels').height($("#pf-page").height()-46);
          $('.panel-body').height($("#pf-page").height()-76)
    }).resize();

    var page = 0,
        pages = ($('.pf-nav').height() / 70) - 1;

    if(pages === 0){
      $('.pf-nav-prev,.pf-nav-next').hide();
    }
	/*菜单栏的上下滚动*/	
    $(document).on('click', '.pf-nav-prev,.pf-nav-next', function(){

      if($(this).hasClass('disabled')) return;
      if($(this).hasClass('pf-nav-next')){/*判断元素是否包含pf-nav-next*/
        page++;
        $('.pf-nav').stop().animate({'margin-top': -70*page}, 200);
        if(page == pages){
          $(this).addClass('disabled');
          $('.pf-nav-prev').removeClass('disabled');
        }else{
          $('.pf-nav-prev').removeClass('disabled');
        }
        
      }else{
        page--;
        $('.pf-nav').stop().animate({'margin-top': -70*page}, 200);
        if(page == 0){
          $(this).addClass('disabled');
          $('.pf-nav-next').removeClass('disabled');
        }else{
          $('.pf-nav-next').removeClass('disabled');
        }
        
      }
    });
    
    $(".sider-nav-s").find("li").click(function(){
    	$.post("fitness/checkUser.html",checkUser,"JSON");
    	function  checkUser(data){
    		if(data=="isAjax"){
				window.location.href="403.jsp";	
				return;    			
    		}
    	}
    })

    // setTimeout(function(){
    //    $('.tabs-panels').height($("#pf-page").height()-46);
    //    $('.panel-body').height($("#pf-page").height()-76)
    // }, 200)