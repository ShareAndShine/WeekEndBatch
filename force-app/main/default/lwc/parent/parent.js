import { LightningElement, api, wire } from "lwc";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import FIELD_NAME from "@salesforce/schema/Account.Name";
import FIELD_OWNER_NAME from "@salesforce/schema/Account.Owner.Name";
import FIELD_PHONE from "@salesforce/schema/Account.Phone";
import FIELD_INDUSTRY from "@salesforce/schema/Account.Industry";
export default class Parent extends LightningElement {
    @api recordId;
    @wire(getRecord, { recordId: "$recordId", fields: [FIELD_NAME, FIELD_INDUSTRY], optionalFields: [FIELD_PHONE, FIELD_OWNER_NAME] })
    account;

    get name() {
        return getFieldValue(this.account.data, FIELD_NAME);
    }
    get phone() {
        return getFieldValue(this.account.data, FIELD_PHONE);
    }
    get industry() {
        return getFieldValue(this.account.data, FIELD_INDUSTRY);
    }
    get owner() {
        return getFieldValue(this.account.data, FIELD_OWNER_NAME);
    }
    sayHi() {
        
        let cmp = this.refs.child;
        cmp.sayHi();
    }
}