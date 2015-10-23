// Copyright 2015 Las Venturas Playground. All rights reserved.
// Use of this source code is governed by the MIT license, a copy of which can
// be found in the LICENSE file.

let Assert = require('base/test/assert.js');

describe('Assert', it => {
  // TODO: assert(expression, message)
  // TODO: assert.fail(actual, expected, [message], [operator])
  // TODO: assert.ok(object, [message])
  // TODO: assert.notOk(object, [message])

  it('equal', assert => {
    let fn = () => 0;

    assert.equal(null, null);
    assert.equal(undefined, undefined);
    assert.equal(0, -0);
    assert.equal(42, 42);
    assert.equal(42, "42");
    assert.equal("lvp", "lvp");
    assert.equal(fn, fn);
  });

  it('notEqual', assert => {
    assert.notEqual(100, -100);
    assert.notEqual("lvp", "samp");
    assert.notEqual(true, false);
    assert.notEqual([1, 2, 3], [1, 2, 3]);
    assert.notEqual({ a: true }, { a: true });
  });

  it('strictEqual', assert => {
    let fn = () => 0;

    assert.strictEqual(0, -0);
    assert.strictEqual(100, 100);
    assert.strictEqual("lvp", "lvp");
    assert.strictEqual(fn, fn);
  });

  it('notStrictEqual', assert => {
    assert.notStrictEqual(42, "42");
  });

  // TODO: assert.deepEqual(actual, expected, [message])
  // TODO: assert.notDeepEqual(actual, expected, [message])
  
  it('isTrue', assert => {
    assert.isTrue(true);
    assert.isTrue(1);
    assert.isTrue([]);
    assert.isTrue({});
  });

  // TODO: assert.isAbove(valueToCheck, valueToBeAbove, [message])
  // TODO: assert.isBelow(valueToCheck, valueToBeBelow, [message])
  
  it('isFalse', assert => {
    assert.isFalse(false);
    assert.isFalse(0);
    assert.isFalse(null);
    assert.isFalse(undefined);
  });

  it('isNull', assert => {
    assert.isNull(null);
  });

  it('isNotNull', assert => {
    assert.isNotNull(undefined);
    assert.isNotNull(false);
    assert.isNotNull({});
  });

  it('isUndefined', assert => {
    assert.isUndefined(undefined);
    assert.isUndefined();
  });

  it('isDefined', assert => {
    assert.isDefined(null);
    assert.isDefined(false);
    assert.isDefined({});
  });

  it('isFunction', assert => {
    function fn() {}

    assert.isFunction(() => 0);
    assert.isFunction(assert.isFunction);
    assert.isFunction(fn);
    assert.isFunction(class Foo {});
  });

  it('isNotFunction', assert => {
    assert.isNotFunction(null);
    assert.isNotFunction(undefined);
    assert.isNotFunction("lvp");
  });

  it('isObject', assert => {
    assert.isObject({ a: 'foo' });
    assert.isObject(Assert.prototype);
  });

  it('isNotObject', assert => {
    assert.isNotObject("lvp");
    assert.isNotObject([1, 2, 3]);
    assert.isNotObject(false);
  });

  it('isArray', assert => {
    assert.isArray(Array.prototype);
    assert.isArray([1, 2, 3]);
  });

  it('isNotArray', assert => {
    assert.isNotArray("lvp");
    assert.isNotArray({ [Symbol.iterator]() { return 1; }});
    assert.isNotArray(true);
  });

  it('isString', assert => {
    assert.isString("lvp");
    assert.isString("lvp".toString());
  });

  it('isNotString', assert => {
    assert.isNotString(true);
    assert.isNotString([ 'l', 'v', 'p']);
  });

  it('isNumber', assert => {
    assert.isNumber(42);
    assert.isNumber(42.24);
    assert.isNumber(-1337);
  });

  it('isNotNumber', assert => {
    assert.isNotNumber(!!0);
    assert.isNotNumber(Math.NaN);
    assert.isNotNumber("42");
  });

  it('isBoolean', assert => {
    assert.isBoolean(true);
    assert.isBoolean(!!"lvp");
    assert.isBoolean(!!"0");
    assert.isBoolean(true !== false);
  });

  it ('isNotBoolean', assert => {
    assert.isNotBoolean("true");
    assert.isNotBoolean({ true: 1 });
    assert.isNotBoolean("1");
  });

  // TODO: assert.typeOf(value, name, [message])
  // TODO: assert.notTypeOf(value, name, [message])
  // TODO: assert.instanceOf(object, constructor, [message])
  // TODO: assert.notInstanceOf(object, constructor, [message])
  // TODO: assert.include(haystack, needle, [message])
  // TODO: assert.notInclude(haystack, needle, [message])
  // TODO: assert.match(value, regexp, [message])
  // TODO: assert.notMatch(value, regexp, [message])
  // TODO: assert.property(object, property, [message])
  // TODO: assert.notProperty(object, property, [message])
  // TODO: assert.deepProperty(object, property, [message])
  // TODO: assert.notDeepProperty(object, property, [message])
  // TODO: assert.propertyVal(object, property, value, [message])
  // TODO: assert.propertyNotVal(object, property, value, [message])
  // TODO: assert.deepPropertyVal(object, property, value, [message])
  // TODO: assert.deepPropertyNotVal(object, property, value, [message])
  // TODO: assert.lengthOf(object, length, [message])
  // TODO: assert.throws(function, [constructor/string/regexp], [string/regexp], [message])
  // TODO: assert.doesNotThrow(function, [constructor/regexp], [message])
  // TODO: assert.operator(val1, operator, val2, [message])
  // TODO: assert.closeTo(actual, expected, delta, [message])
  // TODO: assert.sameMembers(set1, set2, [message])
  // TODO: assert.sameDeepMembers(set1, set2, [message])
  // TODO: assert.includeMembers(superset, subset, [message])
  // TODO: assert.changes(function, object, property)
  // TODO: assert.doesNotChange(function, object, property)
  // TODO: assert.increases(function, object, property)
  // TODO: assert.doesNotIncrease(function, object, property)
  // TODO: assert.decreases(function, object, property)
  // TODO: assert.doesNotDecrease(function, object, property)
});
