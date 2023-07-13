// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com).

// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at

// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;
import ballerinax/health.hl7v2 as hl7;

final string msg = "MSH|^~\\&|ADT1|GOOD HEALTH HOSPITAL|GHH LAB, INC.|GOOD HEALTH HOSPITAL|" +
"198808181126|SECURITY|ADT^A01^ADT_A01|MSG00001|P|2.5||\rEVN|A01|200708181123||" +
"\rPID|1||PATID1234^5^M11^ADT1^MR^GOOD HEALTH HOSPITAL~123456789^^^USSSA^SS||" +
"BATMAN^ADAM^A^III||19610615|M||C|2222 HOME STREET^^GREENSBORO^NC^27401-1020|GL|" +
"(555) 555-2004|(555)555-2004||S||PATID12345001^2^M10^ADT1^AN^A|444333333|987654^NC|" +
"\rNK1|1|NUCLEAR^NELDA^W|SPO^SPOUSE||||NK^NEXT OF KIN$\rPV1|1|I|2000^2012^01||||" +
"004777^ATTEND^AARON^A|||SUR||||ADM|A0|";

final string msgWithAllSegments = "MSH|^~\\&|ADT1|GOOD HEALTH HOSPITAL|GHH LAB, INC.|GOOD HEALTH HOSPITAL|" +
"198808181126|SECURITY|ADT^A0X^ADT_A0X|MSG00001|P|2.5||\rEVN|A01|200708181123||\r" +
"APR|\rQPD|\rSTF|\rCM1|\rVAR|\rCM0|\rCM2|\rCDM|\rDG1|\rOM1|\rOM3|\rNK1|\rOM2|\rOM5|\rOM4|\rOM7|\rOM6|\rODT|\r" +
"AIG|\rNSC|\rODS|\rEQL|\rLOC|\rFT1|\rAIL|\rEQP|\rAIP|\rEQU|\rAIS|\rIIM|\rQID|\rNST|\rCER|\rIAM|\rNCK|\rBLC|\r" +
"QAK|\rBLG|\rTXA|\rNTE|\rRCP|\rARQ|\rBTS|\rQRD|\rMRG|\rERR|\rFTS|\rQRF|\rUB2|\rERQ|\rUB1|\rURD|\rBTX|\rCNS|\r" +
"QRI|\rOVR|\rABS|\rVTQ|\rTQ2|\rRDF|\rTQ1|\rURS|\rMSA|\rISD|\rNDS|\rSFT|\rACC|\rCON|\rMSH|\rRDT|\rGOL|\rAL1|\r" +
"ECD|\rGP2|\rGP1|\rPID|\rPR1|\rRMI|\rDB1|\rECR|\rDRG|\rLAN|\rRF1|\rPRA|\rPRC|\rADD|\rPRB|\rPRD|\rLRL|\rSPM|\r" +
"SPR|\rDSC|\rEDU|\rAUT|\rDSP|\rPSH|\rIN2|\rIN1|\rLCC|\rROL|\rIN3|\rSID|\rLCH|\rSAC|\rTCD|\rTCC|\rRXA|\rEVN|\r" +
"PD1|\rRXC|\rPCR|\rRXE|\rRGS|\rRXD|\rBPO|\rRXG|\rAFF|\rORC|\rORG|\rPTH|\rRXO|\rMFA|\rBPX|\rBHS|\rPDA|\rMFE|\r" +
"RXR|\rPDC|\rFHS|\rINV|\rMFI|\rNPU|\rRQ1|\rLDP|\rOBR|\rCSP|\rCSS|\rCSR|\rOBX|\rRQD|\rGT1|\rFAC|\rPV1|\rPV2|\r" +
"CTD|\rCTI|\rSCH|\rPEO|\rIPC|\rPES|";

@test:Config {}
function parseHl7Message() {
    hl7:Message|hl7:HL7Error parseResult = hl7:parse(msg);
    if parseResult is hl7:Message {
        test:assertEquals(parseResult.name, "ADT_A01", "Parsing issue occurred with the message");
    } 
}

@test:Config {}
function testEncodeHl7Message() returns error? {
    QRY_A19 qry_a19 = {
        msh: {
            msh3: {hd1: "ADT1"},
            msh4: {hd1: "MCM"},
            msh5: {hd1: "LABADT"},
            msh6: {hd1: "MCM"},
            msh8: "SECURITY",
            msh9: {msg1: "QRY", msg2: "A19"},
            msh10: "MSG00001",
            msh11: {pt1: "P"},
            msh12: {
                vid1: "2.5"
            }
        },
        qrd: {
            qrd1: {ts1: "20220828104856+0000"},
            qrd2: "R",
            qrd3: "I",
            qrd4: "QueryID01",
            qrd7: {cq1: "5"},
            qrd8: [{xcn1: "1", xcn2: {fn1: "ADAM"}, xcn3: "EVERMAN"}],
            qrd9: [{ce1: "VXI"}],
            qrd10: [{ce1: "SIIS"}]
        }
    };
    byte[] encodedQRYA19 = check hl7:encode(VERSION, qry_a19);
    test:assertEquals(encodedQRYA19[0], hl7:HL7_MSG_START_BLOCK, "HL7 Message start block is not correct");
}

@test:Config {}
function testNonExistantMsgWithAllSegments() {
    hl7:Message|hl7:HL7Error parseResult = hl7:parse(msgWithAllSegments);
    test:assertTrue(parseResult is hl7:HL7Error, "Undefined messages are not handled properly");
}
