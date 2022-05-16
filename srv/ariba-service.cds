using {arb} from '../db/ariba';

service AribaService {
    entity Task               as projection on arb.Task;
    entity Changes            as projection on arb.Changes;
    entity TaskChanges        as projection on arb.TaskChanges;
    entity PendingApprovables as projection on arb.PendingApprovables;
}
