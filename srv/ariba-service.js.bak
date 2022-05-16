// Imports
const cds = require("@sap/cds");

module.exports = cds.service.impl(async function () {
    const { Task, Changes, PendingApprovables } = this.entities;
    const AribaApi = await cds.connect.to("AribaApi");

    this.on("READ", "*", async (req, res) => {
        req.headers.accept = "application/json";
        req.headers.apikey = process.env.apikey;

        if (req.target.name === "AribaService.Task"){
            try {
                return await AribaApi.tx(req).get("/Task");
            } catch (e) {
                if (e.innererror.response.status || e.innererror.response.body.description) {
                    req.reject(e.innererror.response.status, e.innererror.response.body.description);
                }
            }
        } else if (req.target.name === "AribaService.Changes"){
            try {
                return await AribaApi.tx(req).get("/changes");
            } catch (e) {
                if (e.innererror.response.status || e.innererror.response.body.description) {
                    req.reject(e.innererror.response.status, e.innererror.response.body.description);
                }
            }
        } else if (req.target.name === "AribaService.PendingApprovables") {
            try {
                return await AribaApi.tx(req).get("/pendingApprovables");
            } catch (e) {
                if (e.innererror.response.status || e.innererror.response.body.description) {
                    req.reject(e.innererror.response.status, e.innererror.response.body.description);
                }
            }
        } else if (req.target.name === "AribaService.TaskChanges") {
            try {
                const taskList = await AribaApi.tx(req).get("/Task");
                //buble sorting
                taskList.sort(function(a,b) {return a.id-b.id;});

                const changeList = await AribaApi.tx(req).get("/changes");
                //buble sorting
                changeList.sort(function(a,b) {return a.approvableUniqueName-b.approvableUniqueName;});

                const items = parseTaskChange(taskList, changeList);
                items.sort(function(a,b) {return a.approvableUniqueName-b.approvableUniqueName;});

                return items;
            } catch (e) {
                if (e.innererror.response.status || e.innererror.response.body.description) {
                    req.reject(e.innererror.response.status, e.innererror.response.body.description);
                }
            }
        }
    });
});

function parseTaskChange (aTaskList, aChangeList) {
    var aTaskChangeList = [];

	for (let i=0; i<aTaskList.length; i++){
        var obj = {};
        var oTaskElement = aTaskList[i];
        var oChangeElement = aChangeList.find(element => element.approvableUniqueName === oTaskElement.id);

        if (oChangeElement) {
            //task properties
            obj.activeApprovalRequestIds = oTaskElement.activeApprovalRequestIds;
            obj.taskId                   = oTaskElement.taskId;
            obj.workspaceId              = oTaskElement.workspaceId;

            //changes properties
            obj.approvableUniqueName     = oChangeElement.approvableUniqueName;
            obj.changeParameters         = oChangeElement.changeParameters;
            obj.changeType               = oChangeElement.changeType;

            aTaskChangeList.push(obj);
        }
    }
    return aTaskChangeList;
}