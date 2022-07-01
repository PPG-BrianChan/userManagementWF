{
	"contents": {
		"4b4380ae-261e-45e3-9290-c03b56325b9d": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "usermanagementapproval",
			"subject": "userManagementApproval",
			"name": "userManagementApproval",
			"documentation": "Approval process for user management - unlock ID",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"73d92523-4f1f-49ce-80c2-ceeb15ce9697": {
					"name": "approvalStep"
				},
				"aaba9859-b1d7-43b0-b016-519e3f43f050": {
					"name": "isApproved"
				},
				"f58dbad1-be73-421d-a1b6-a05de58b33f6": {
					"name": "sendMail"
				},
				"f3659b87-431d-4c90-aee2-f011767e1266": {
					"name": "unlockUser"
				},
				"5082b41a-0f44-4c77-9cd7-d79871bc4174": {
					"name": "prepareMail"
				}
			},
			"sequenceFlows": {
				"62814c4d-7c2c-4e33-9783-6c47468e5520": {
					"name": "SequenceFlow3"
				},
				"27354761-7218-495d-9866-71f0f7ab63b0": {
					"name": "rejected"
				},
				"1afa6a97-ec6c-4880-87d1-6378f6718d8a": {
					"name": "approved"
				},
				"3c8de88a-1337-470c-b30e-ffa0f9caabb1": {
					"name": "SequenceFlow15"
				},
				"3cc5a20c-b207-466e-a1b8-ca612026d9eb": {
					"name": "SequenceFlow16"
				},
				"226be06d-dca0-40ac-a89d-a1802775cfca": {
					"name": "SequenceFlow17"
				},
				"c5b9075f-9f90-4eb0-a616-ba1713c26663": {
					"name": "SequenceFlow18"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"73d92523-4f1f-49ce-80c2-ceeb15ce9697": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approval for Ticket No: ${context.approvalrequest.ticketno}",
			"description": "Requesting for your kind approval to unlock user ID with details below.",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.approvalrequest.approver}",
			"formReference": "/forms/userManagementApproval/approvalForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approvalform"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "approvalStep"
		},
		"aaba9859-b1d7-43b0-b016-519e3f43f050": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "isApproved",
			"default": "27354761-7218-495d-9866-71f0f7ab63b0"
		},
		"f58dbad1-be73-421d-a1b6-a05de58b33f6": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "Mail_Service_API",
			"path": "/mailrequests",
			"httpMethod": "POST",
			"requestVariable": "${context.mailrequest}",
			"responseVariable": "${context.response}",
			"headers": [],
			"id": "servicetask3",
			"name": "sendMail"
		},
		"f3659b87-431d-4c90-aee2-f011767e1266": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "S4HANA_PSD_HTTPS_500_BR",
			"path": "/sap/opu/odata/sap/ZAPI_C_USERMANAGEMENT/unlock?sap-client=500&userid='${context.approvalrequest.userid}'",
			"httpMethod": "POST",
			"xsrfPath": "/sap/opu/odata/sap/ZAPI_C_USERMANAGEMENT?sap-client=500",
			"responseVariable": "${context.unlockResponse}",
			"headers": [],
			"id": "servicetask4",
			"name": "unlockUser"
		},
		"5082b41a-0f44-4c77-9cd7-d79871bc4174": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/userManagementApproval/prepareMail.js",
			"id": "scripttask3",
			"name": "prepareMail"
		},
		"62814c4d-7c2c-4e33-9783-6c47468e5520": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "73d92523-4f1f-49ce-80c2-ceeb15ce9697",
			"targetRef": "aaba9859-b1d7-43b0-b016-519e3f43f050"
		},
		"27354761-7218-495d-9866-71f0f7ab63b0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "rejected",
			"sourceRef": "aaba9859-b1d7-43b0-b016-519e3f43f050",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"1afa6a97-ec6c-4880-87d1-6378f6718d8a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision==\"approve\"}",
			"id": "sequenceflow7",
			"name": "approved",
			"sourceRef": "aaba9859-b1d7-43b0-b016-519e3f43f050",
			"targetRef": "f3659b87-431d-4c90-aee2-f011767e1266"
		},
		"3c8de88a-1337-470c-b30e-ffa0f9caabb1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow15",
			"name": "SequenceFlow15",
			"sourceRef": "f58dbad1-be73-421d-a1b6-a05de58b33f6",
			"targetRef": "73d92523-4f1f-49ce-80c2-ceeb15ce9697"
		},
		"3cc5a20c-b207-466e-a1b8-ca612026d9eb": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow16",
			"name": "SequenceFlow16",
			"sourceRef": "f3659b87-431d-4c90-aee2-f011767e1266",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"226be06d-dca0-40ac-a89d-a1802775cfca": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow17",
			"name": "SequenceFlow17",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "5082b41a-0f44-4c77-9cd7-d79871bc4174"
		},
		"c5b9075f-9f90-4eb0-a616-ba1713c26663": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow18",
			"name": "SequenceFlow18",
			"sourceRef": "5082b41a-0f44-4c77-9cd7-d79871bc4174",
			"targetRef": "f58dbad1-be73-421d-a1b6-a05de58b33f6"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"473f90ad-c953-4026-826f-552f1ba950fd": {},
				"cde72958-0a31-433f-bff6-221046eda020": {},
				"e7761525-6c52-43c8-9568-76c2c996ce15": {},
				"4f988e14-cd2b-43f2-a962-590518d8ce36": {},
				"bc71b4e2-3a9d-43f0-8f98-81d306d06fc7": {},
				"dfd7764d-10d3-4531-8d74-bb6f2919c5ab": {},
				"3516ca2c-e6e7-4ad7-ac38-74cd9daa9fdd": {},
				"69076f18-0a68-46f6-974b-bfee6bd27525": {},
				"d8ecff06-5b76-46e3-b956-7f5bf8349d0f": {},
				"647dc983-7b50-45e9-805c-cc557aebb47b": {},
				"07b0a78b-a6de-43e5-9d9c-d7cb06286ab3": {},
				"e726eb22-171f-427d-b338-295bee1897f0": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 43.999999701976776,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 825.9999976158142,
			"y": 42.499999701976776,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"473f90ad-c953-4026-826f-552f1ba950fd": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 394,
		},
		"cde72958-0a31-433f-bff6-221046eda020": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 544,
			"y": 38.999999701976776,
			"object": "aaba9859-b1d7-43b0-b016-519e3f43f050"
		},
		"e7761525-6c52-43c8-9568-76c2c996ce15": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "494,59.999999701976776 544,59.999999701976776",
			"sourceSymbol": "473f90ad-c953-4026-826f-552f1ba950fd",
			"targetSymbol": "cde72958-0a31-433f-bff6-221046eda020",
			"object": "62814c4d-7c2c-4e33-9783-6c47468e5520"
		},
		"4f988e14-cd2b-43f2-a962-590518d8ce36": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "586,59.999999701976776 620.9999994039536,59.999999701976776 620.9999994039536,12 790.9999982118607,12 790.9999982118607,59.999999701976776 825.9999976158142,59.999999701976776",
			"sourceSymbol": "cde72958-0a31-433f-bff6-221046eda020",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "27354761-7218-495d-9866-71f0f7ab63b0"
		},
		"bc71b4e2-3a9d-43f0-8f98-81d306d06fc7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "586,59.999999701976776 620.9999994039536,59.999999701976776 620.9999994039536,77.99999940395355 655.9999988079071,77.99999940395355",
			"sourceSymbol": "cde72958-0a31-433f-bff6-221046eda020",
			"targetSymbol": "69076f18-0a68-46f6-974b-bfee6bd27525",
			"object": "1afa6a97-ec6c-4880-87d1-6378f6718d8a"
		},
		"dfd7764d-10d3-4531-8d74-bb6f2919c5ab": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 244,
=======
			"points": "344,59.999999701976776 394,59.999999701976776",
			"sourceSymbol": "dfd7764d-10d3-4531-8d74-bb6f2919c5ab",
			"targetSymbol": "473f90ad-c953-4026-826f-552f1ba950fd",
			"object": "3c8de88a-1337-470c-b30e-ffa0f9caabb1"
=======
			"points": "455.9999988079071,42 505.9999988079071,42",
			"sourceSymbol": "ba500a92-c25b-4ad6-9aea-205eea184f19",
			"targetSymbol": "28017128-bfbd-4a6d-9f77-1f68441d138b",
			"object": "febf4b40-9392-40f2-8ef5-1820b01cb22e"
>>>>>>> 5fe64c3641a0fe16ff7f565d8a9e7a6ec953c220
		},
		"69076f18-0a68-46f6-974b-bfee6bd27525": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 655.9999988079071,
			"y": 47.99999940395355,
			"width": 100,
			"height": 60,
			"object": "f3659b87-431d-4c90-aee2-f011767e1266"
		},
		"d8ecff06-5b76-46e3-b956-7f5bf8349d0f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "755.9999988079071,77.99999940395355 790.9999982118607,77.99999940395355 790.9999982118607,59.999999701976776 825.9999976158142,59.999999701976776",
			"sourceSymbol": "69076f18-0a68-46f6-974b-bfee6bd27525",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "3cc5a20c-b207-466e-a1b8-ca612026d9eb"
		},
		"647dc983-7b50-45e9-805c-cc557aebb47b": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 94,
			"y": 29.999999701976776,
			"width": 100,
			"height": 60,
			"object": "5082b41a-0f44-4c77-9cd7-d79871bc4174"
		},
		"07b0a78b-a6de-43e5-9d9c-d7cb06286ab3": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,59.999999701976776 94,59.999999701976776",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "647dc983-7b50-45e9-805c-cc557aebb47b",
			"object": "226be06d-dca0-40ac-a89d-a1802775cfca"
		},
		"e726eb22-171f-427d-b338-295bee1897f0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,59.999999701976776 244,59.999999701976776",
			"sourceSymbol": "647dc983-7b50-45e9-805c-cc557aebb47b",
			"targetSymbol": "dfd7764d-10d3-4531-8d74-bb6f2919c5ab",
			"object": "c5b9075f-9f90-4eb0-a616-ba1713c26663"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"maildefinition": 1,
			"sequenceflow": 18,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 6,
			"scripttask": 4,
			"mailtask": 1,
			"exclusivegateway": 1
		}
	}
}