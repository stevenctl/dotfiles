extends VisualShaderNode
#brief A [Color] operator to be used within the visual shader graph.
#desc Applies [member operator] to two color inputs.
class_name VisualShaderNodeColorOp

#desc Produce a screen effect with the following formula:
#desc [codeblock]
#desc result = vec3(1.0) - (vec3(1.0) - a) * (vec3(1.0) - b);
#desc [/codeblock]
#desc Produce a difference effect with the following formula:
#desc [codeblock]
#desc result = abs(a - b);
#desc [/codeblock]
#desc Produce a darken effect with the following formula:
#desc [codeblock]
#desc result = min(a, b);
#desc [/codeblock]
#desc Produce a lighten effect with the following formula:
#desc [codeblock]
#desc result = max(a, b);
#desc [/codeblock]
#desc Produce an overlay effect with the following formula:
#desc [codeblock]
#desc for (int i = 0; i < 3; i++) {
#desc float base = a[i];
#desc float blend = b[i];
#desc if (base < 0.5) {
#desc result[i] = 2.0 * base * blend;
#desc } else {
#desc result[i] = 1.0 - 2.0 * (1.0 - blend) * (1.0 - base);
#desc }
#desc }
#desc [/codeblock]
#desc Produce a dodge effect with the following formula:
#desc [codeblock]
#desc result = a / (vec3(1.0) - b);
#desc [/codeblock]
#desc Produce a burn effect with the following formula:
#desc [codeblock]
#desc result = vec3(1.0) - (vec3(1.0) - a) / b;
#desc [/codeblock]
#desc Produce a soft light effect with the following formula:
#desc [codeblock]
#desc for (int i = 0; i < 3; i++) {
#desc float base = a[i];
#desc float blend = b[i];
#desc if (base < 0.5) {
#desc result[i] = base * (blend + 0.5);
#desc } else {
#desc result[i] = 1.0 - (1.0 - base) * (1.0 - (blend - 0.5));
#desc }
#desc }
#desc [/codeblock]
#desc Produce a hard light effect with the following formula:
#desc [codeblock]
#desc for (int i = 0; i < 3; i++) {
#desc float base = a[i];
#desc float blend = b[i];
#desc if (base < 0.5) {
#desc result[i] = base * (2.0 * blend);
#desc } else {
#desc result[i] = 1.0 - (1.0 - base) * (1.0 - 2.0 * (blend - 0.5));
#desc }
#desc }
#desc [/codeblock]
#desc Represents the size of the [enum Operator] enum.

#enum Operator
enum {
    OP_SCREEN = 0,
    OP_DIFFERENCE = 1,
    OP_DARKEN = 2,
    OP_LIGHTEN = 3,
    OP_OVERLAY = 4,
    OP_DODGE = 5,
    OP_BURN = 6,
    OP_SOFT_LIGHT = 7,
    OP_HARD_LIGHT = 8,
    OP_MAX = 9,
}
#desc An operator to be applied to the inputs. See [enum Operator] for options.
var operator: int:
	get = get_operator, set = set_operator




func get_operator() -> int:
	return operator

func set_operator(value: int) -> void:
	operator = value

