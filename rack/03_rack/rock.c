#include "ruby.h"

VALUE method_call(VALUE self, VALUE env) {
  VALUE response = rb_ary_new();

  VALUE headers = rb_hash_new();
  rb_hash_aset(headers, rb_str_new2("Content-Type"), rb_str_new2("text/html"));
  
  rb_ary_push(response, INT2NUM(200));
  rb_ary_push(response, headers);
  rb_ary_push(response, rb_str_new2("Hello Rock"));
  return response;
}

void Init_rock() {
  VALUE Rock = rb_define_class("Rock", rb_cObject);
  rb_define_method(Rock, "call", method_call, 1);
}
