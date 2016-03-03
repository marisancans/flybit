$("#product_department_id").empty()
  .append("<%= escape_javascript(render(:partial => @category)) %>")