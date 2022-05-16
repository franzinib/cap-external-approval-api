using AribaService as service from '../../srv/ariba-service';

// list report page
annotate service.Changes with @(
    UI.HeaderInfo : {
        TypeName : 'Change',
        TypeNamePlural : 'Changes',
        Title : {
            $Type : 'UI.DataField',
            Value : changeParameters
        },
        Description : {
            $Type : 'UI.DataField',
            Value : approvableUniqueName
        }
    },
    
    UI.Identification : [ 
        { Value : changeSequenceId } 
    ],

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : changeSequenceId,
            Label : 'Sequence Id',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : changeParameters,
            Label : 'Parameters',
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : changeType,
            Label : 'Type',
            ![@UI.Importance] : #Medium
        },
        {
            $Type : 'UI.DataField',
            Value : restResourceName,
            Label : 'Resource Name',
            ![@UI.Importance] : #Low
        },
        {
            $Type : 'UI.DataField',
            Value : approvableUniqueName,
            Label : 'Unique Name',
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : realm,
            Label : 'Realm',
            ![@UI.Importance] : #Medium
        }
    ],
    
    UI.SelectionFields : [
        changeSequenceId,
        changeParameters,
        approvableUniqueName
    ]
);

annotate service.Changes with @(UI: {
    Facets : [
        { 
            $Type : 'UI.ReferenceFacet', 
            Label : 'Main', 
            Target : '@UI.FieldGroup#Main', 
        }
    ], 
    
    FieldGroup #Main : {
        Data : [ 
            { Value : changeSequenceId },
            { Value : changeParameters },
            { Value : changeType },
            { Value : restResourceName },
            { Value : approvableUniqueName },
            { Value : realm }
        ]
    }
});

annotate service.Changes with {
    changeSequenceId @Common.Label : 'Sequence Id'
};
annotate service.Changes with {
    changeParameters @Common.Label : 'Parameters'
};
annotate service.Changes with {
    approvableUniqueName @Common.Label : 'Unique Name'
};
