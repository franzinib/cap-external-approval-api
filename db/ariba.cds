namespace arb; 
//using { managed } from '@sap/cds/common'; 

entity Task {
    key activeApprovalRequestIds: String;
        owner                   : {
            type                : String;
            user {
                name            : String;
                passwordAdapter : String;
                emailAddress    : String;
                realm           : String;
                uniqueName      : String;
                phone           : String;
            };
        };
        workspaceAribaType      : String;
        comments                : String;
        phaseApplicability      : String;
        endDate                 : String;
        document                : {
            id                  : Association to Changes;
            aribaType           : String;
            entityType          : String;
            content             : {
                questionnaireTitle      : String;
                questionnaireId         : String;
                processId               : String;
                format                  : String;
                workspaceId             : String;
                requesterLocale         : String;
                locale                  : String;
                questionnaireDueDate    : String;
                questionnaireStatus     : String;
                items : array of {
                    itemId                      : String; 
                    answerType                  : String;
                    label                       : String;
                    maxLength                   : String;
                    externalSystemCorrelationId: String;
                    number                      : String;
                    qualifiedNumber             : String;
                    required                    : Boolean;
                    editable                    : Boolean;
                    affectsVisibility           : Boolean;
                    precision                   : String;
                    allowAttachmentsAndComments: Boolean;
                    vendorFieldMapping          : String;
                    fieldMappings               : array of {};
                };
                answers : array of {
                    itemId                      : String;
                    externalSystemCorrelationId : String;
                    answer                      : String;
                };
                draft   : Boolean;
            };
        };
        dueDate                 : String;
        description             : String;
        altStatus               : String;
        displayStatus           : String;
        title                   : String;
        workspaceTitle          : String;
        required                : Boolean;
        dependencies            : String;
        beginDate               : String;
        originalOwner: {
            type: String;
            user: {
                name            : String;
                passwordAdapter : String;
                emailAddress    : String;
                realm           : String;
                uniqueName      : String;
                phone           : String;
            };
        };
        approvalRequests: array of {
            state                           : String;
            approvalState                   : String;
            approvalRequired                : Boolean;
            reason                          : String;
            assignedDate                    : String;
            id                              : String;
            taskId                          : String;
            dependencyApprovalRequestsUID   : String;
            approvers : array of {
                type : String;
                user : {
                    name            : String;
                    passwordAdapter : String;
                    emailAddress    : String;
                    realm           : String;
                    uniqueName      : String;
                    phone           : String;
                };
            };
        };
        isObsoleted         : String;
        workspaceEntityType : String;
        id                  : String;
        obsoleted           : Boolean;
        status              : String;
        workspaceId         : String;
}
 
entity Changes { 
    key changeSequenceId        : String;
        changeParameters        : String;
        changeType              : String;
        restResourceName        : String;
        approvableUniqueName    : String ;
        realm                   : String;
} 

entity TaskChanges {
    //Task entity
    key activeApprovalRequestIds: String;   
        id                      : String;
        workspaceId             : String;

    //changes entity
        approvableUniqueName    : String;
        changeParameters        : String;
        changeType              : String;        
}

entity PendingApprovables {
    key uniqueName              : String;
        documentType            : String;
        description             : String;
        assignedDate            : String;
        approver                : String;
        email                   : String;
}