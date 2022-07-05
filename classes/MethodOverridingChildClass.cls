public with sharing class MethodOverridingChildClass extends MethodOverridingParentClass {
    public override void show() {
        System.debug('This is Child Class Method');
    }
}