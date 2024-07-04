import { LightningElement, wire } from 'lwc';
import { EnclosingUtilityId, minimize } from 'lightning/platformUtilityBarApi';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { gql, graphql } from "lightning/uiGraphQLApi";

export default class LWCUtilitybarTester extends LightningElement {
    results;
    errors;

      @wire(graphql, {

        query: gql`
        
        `,
    })
  graphqlQueryResult({ data, errors }) {
    if (data) {
      this.results = data.uiapi.query.Account.edges.map((edge) => edge.node);
    }
    this.errors = errors;
  }


    @wire(EnclosingUtilityId)
    utilityId;
    
    handleClick() {
        console.log('clicked with utilityId: ' + this.utilityId);
        console.log('minimize: ' + typeof(minimize) + ' ' + (minimize !== null) + ' ' + (minimize !== undefined));
        
        if (minimize) {
            minimize(this.utilityId);
        }
    }
}