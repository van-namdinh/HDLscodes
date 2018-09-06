/*
 * Project name   :
 * File name      : module_cseladd.v
 * Created date   : Th08 28 2018
 * Author         : Van-Nam DINH 
 * Last modified  : Th08 28 2018 18:13
 * Desc           :
 */

module top_module(
    input   [31:0]  a,
    input   [31:0]  b,
    input   [1:0]   sel:q 
    output  [31:0]  sum
);
    
