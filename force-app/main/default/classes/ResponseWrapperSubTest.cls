@IsTest
private class ResponseWrapperSubTest {
    public static Sub_ToDo__c sub = new Sub_ToDo__c(
        Id = 'a0009000007Xe8FAAS',
        Name = 'Test01',
        Status__c = false,
        ToDo__c = 'a0009000007Xe8FAAS'
    );

    @IsTest
    static void testDoMapping() {
        ResponseWrapperSub wrapper = new ResponseWrapperSub();
        wrapper.id = sub.Id;
        wrapper.name = sub.Name;
        wrapper.status = sub.Status__c;
        wrapper.relatedTodo = sub.ToDo__c;

        Test.startTest();
        ResponseWrapperSub newWrapper = ResponseWrapperSub.doMapping(sub);
        Test.stopTest();

        System.assertEquals(wrapper.id, newWrapper.id);
        System.assertEquals(wrapper.name, newWrapper.name);
        System.assertEquals(wrapper.status, newWrapper.status);
        System.assertEquals(wrapper.relatedTodo, newWrapper.relatedTodo);
    }

    @IsTest
    static void testdoMappingToWrappers() {
        ResponseWrapperSub wrapper = new ResponseWrapperSub();
        wrapper.id = sub.Id;
        wrapper.name = sub.Name;
        wrapper.status = sub.Status__c;
        wrapper.relatedTodo = sub.ToDo__c;

        List<Sub_ToDo__c> subs = new List<Sub_ToDo__c>();
        subs.add(sub);

        Test.startTest();
        List<ResponseWrapperSub> wrappers = ResponseWrapperSub.doMappingToWrappers(subs);
        Test.stopTest();

        for (ResponseWrapperSub newWrapper : wrappers) {
            System.assertEquals(wrapper.id, newWrapper.id);
            System.assertEquals(wrapper.name, newWrapper.name);
            System.assertEquals(wrapper.status, newWrapper.status);
            System.assertEquals(wrapper.relatedTodo, newWrapper.relatedTodo);
        }
    }
}