---
layout: page
title: "Index"
description: "Key Words Index | 关键词索引"  
header-img: "img/2.jpg"  
---

## Guides | 本页使用方法

1. Choose a interesting word  在下面选一个你喜欢的词
2. Click it  点击它
3. Jump to it 相关的文章会「唰」地一声跳到页面顶端
4. Try it ?  马上试试？

## My Index


<div id='tag_cloud'>
{% for tag in site.tags %}
<b><a href="#{{ tag[0] }}" title="{{ tag[0] }}" rel="{{ tag[1].size }}">{{ tag[0] }}</a></b>&nbsp;&nbsp;&nbsp;
{% endfor %}
</div>

<ul class="listing">
{% for tag in site.tags %}
  <h3 class="listing-seperator" id="{{ tag[0] }}">{{ tag[0] }}</h3>
{% for post in tag[1] %}
  <li class="listing-item">
  <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time>
  <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
  </li>
{% endfor %}
{% endfor %}
</ul>

<script src="/media/js/jquery.tagcloud.js" type="text/javascript" charset="utf-8"></script> 
<script language="javascript">
$.fn.tagcloud.defaults = {
    size: {start: 1, end: 1, unit: 'em'},
      color: {start: '#f8e0e6', end: '#ff3333'}
};

$(function () {
    $('#tag_cloud a').tagcloud();
});
</script>
