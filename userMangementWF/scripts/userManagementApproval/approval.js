/*
// read from existing workflow context 
var productInfo = $.context.productInfo; 
var productName = productInfo.productName; 
var productDescription = productInfo.productDescription;

// read contextual information
var taskDefinitionId = $.info.taskDefinitionId;

// read user task information
var lastUserTask1 = $.usertasks.usertask1.last;
var userTaskSubject = lastUserTask1.subject;
var userTaskProcessor = lastUserTask1.processor;
var userTaskCompletedAt = lastUserTask1.completedAt;

var userTaskStatusMessage = " User task '" + userTaskSubject + "' has been completed by " + userTaskProcessor + " at " + userTaskCompletedAt;

// create new node 'product'
var product = {
		productDetails: productName  + " " + productDescription,
		workflowStep: taskDefinitionId
};

// write 'product' node to workflow context
$.context.product = product;
*/

var ticketno = $.context.approvalrequest.ticketno;
var targetid = $.context.approvalrequest.targetid;
var system = $.context.approvalrequest.system;
var client = $.context.approvalrequest.client;

var subject = "Approval request for user management process - Ticket " + ticketno;
var body = "You have a pending approval for ticket no " + ticketno + " to unlock user id " + targetid + " in system " + system + " client " + client;

var mailrequest ={
    sender : "SAPCOEBTPGeneral@ppg.com",
    recipient : "cchan@ppg.com",
    subject : subject,
    body : body
}

// var mailrequest ={
//     sender : "SAPCOEBTPGeneral@ppg.com",
//     recipient : "cchan@ppg.com",
//     subject : "Mail from Workflow",
//     body : "This is a mail from workflow"
// }

$.context.mailrequest = mailrequest;
