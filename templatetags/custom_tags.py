from django import template

register = template.Library()

@register.filter
def in_lineitem(sales_order, id):
    return sales_order.filter(sales=id)