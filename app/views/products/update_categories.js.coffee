$("#product_category_id").empty()
  .append("<%= escape_javascript(render(:partial => @categories)) %>")