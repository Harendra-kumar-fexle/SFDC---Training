trigger TriggerContact on Contact (before insert) {
    If(Trigger.isBefore) {
        If(Trigger.isInsert || Trigger.isUpdate) {
            ContactTriggerHelper.populateAccountOnContact(Trigger.New);
        }
    }
}