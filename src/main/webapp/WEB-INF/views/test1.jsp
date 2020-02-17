<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>http://www.blueb.co.kr</title>


	<link rel="stylesheet" href="./resources/style1.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>

<div class="site-wrapper">
	<div class="main">
		<div class="wrap"> <a href="#navigation" title="navigation menu" aria-label="navigation menu"> Navigation Menu <span class="bar bar-1"></span> <span class="bar bar-2"></span> <span class="bar bar-3"></span> </a>
			<h1 class="content">상단 메뉴 아이콘을 클릭하세요</h1>
		</div>
	</div>

	<nav id="navigation" role="navigation">
		<ul>
			<li class="active"><a href="#">Home</a></li>
			<li><a href="#">blueb</a></li>
			<li><a href="#">Javascript</a></li>
			<li><a href="#">CSS/HTML</a></li>
			<li><a href="#">Design</a></li>
		</ul>
	</nav>
</div>

<script>
var Nav = function($) {
  
  return {
    
    init: function() {
      this.cacheDom();
      this.setupAria();
      this.bindEvents();
    },
    
    cacheDom: function() {
      this.$site = $('.site-wrapper');
      this.$navBtn = this.$site.find('[href="#navigation"]');
      this.$navBtnExpanded = this.$site.find('[aria-expanded]');
      this.$nav = $('#navigation');
      this.$navFirstLink = this.$nav.find('li:first-child a');
      this.$navLastLink = this.$nav.find('li:last-child a');
      this.$content = this.$site.find('.content');
    },
    
    bindEvents: function() {
      this.$navBtn.on('click', this.toggleMenu.bind(this));
      this.$navBtnExpanded.on('keydown', this.setFocus.bind(this));
      this.$navFirstLink.on('keydown', this.returnFocusFirst.bind(this));
      this.$navLastLink.on('keydown', this.returnFocusLast.bind(this));
    },
    
    setupAria: function() {
      this.$navBtn.attr({
			  'role': 'button',
			  'aria-controls': 'navigation',
			  'aria-expanded': 'false'
			});
      
      this.$site.attr({
			  'data-nav-visible': 'false'
			});
    },
    
    toggleMenu: function() {
      var self = $(event.currentTarget);
      event.preventDefault();    
			self.attr('aria-expanded') === 'true' ? this.closeMenu() : this.openMenu();
    },
    
    openMenu: function() {
      this.$site.attr({
			  'data-nav-visible': 'true'
			});
      this.$navBtn.attr({
        'aria-expanded': 'true'
      });
    },
    
    closeMenu: function() {
      this.$site.attr({
			  'data-nav-visible': 'false'
			});
      this.$navBtn.attr({
        'aria-expanded': 'false'
      });
    },
    
    returnFocusFirst: function() {
      if (event.keyCode === 9) {
        if (event.shiftKey) {
          event.preventDefault();
          this.$navBtn.focus();
        }
      }
    },
    
    returnFocusLast: function() {
      if (event.keyCode === 9) {
        if (!event.shiftKey) {
          event.preventDefault();
          this.$navBtn.focus();
        }
      }
    },
    
    setFocus: function() {
      var self = $(event.target);
      if (event.keyCode === 9) {
        if (self.attr('aria-expanded') == 'true') {
          if (!event.shiftKey) {
            event.preventDefault();
            this.$navFirstLink.focus();
          } else {
            if (event.shiftKey) {
              event.preventDefault();
              this.$content.focus();
            }
          }
        }
      }
    }
  }
  
}(jQuery);

Nav.init();
</script>

</body>
</html>
