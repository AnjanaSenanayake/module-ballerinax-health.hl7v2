
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

import ballerinax/health.hl7v2;


# The ACC segment contains patient information relative to an accident in which the patient has been involved.
#
# + name - Segment Name
# + pcr1 - Segment Record Field
# + pcr2 - Segment Record Field
# + pcr3 - Segment Record Field
# + pcr4 - Segment Record Field
# + pcr5 - Segment Record Field
# + pcr6 - Segment Record Field
# + pcr7 - Segment Record Field
# + pcr8 - Segment Record Field
# + pcr9 - Segment Record Field
# + pcr10 - Segment Record Field
# + pcr11 - Segment Record Field
# + pcr12 - Segment Record Field
# + pcr13 - Segment Record Field
# + pcr14 - Segment Record Field
# + pcr15 - Segment Record Field
# + pcr16 - Segment Record Field
# + pcr17 - Segment Record Field
# + pcr18 - Segment Record Field
# + pcr19 - Segment Record Field
# + pcr20 - Segment Record Field
# + pcr21 - Segment Record Field
# + pcr22 - Segment Record Field
# + pcr23 - Segment Record Field
@hl7v2:SegmentDefinition {
    name: "PCR",
    required: false,
    maxReps: 0,
    fields: {
        "pcr1": {
            required: true,
            length: 1,
            maxReps: 1,
            dataType: CE
        },
        "pcr2": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: IS
        },
        "pcr3": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: CE
        },
        "pcr4": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: CQ
        },
        "pcr5": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: TS
        },
        "pcr6": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: TS
        },
        "pcr7": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: TS
        },
        "pcr8": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: TS
        },
        "pcr9": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: IS
        },
        "pcr10": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: CE
        },
        "pcr11": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: IS
        },
        "pcr12": {
            required: false,
            length: 1,
            maxReps: -1,
            dataType: ST
        },
        "pcr13": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: IS
        },
        "pcr14": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: CE
        },
        "pcr15": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: CE
        },
        "pcr16": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: CE
        },
        "pcr17": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: ID
        },
        "pcr18": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: TS
        },
        "pcr19": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: ID
        },
        "pcr20": {
            required: false,
            length: 1,
            maxReps: 1,
            dataType: ID
        },
        "pcr21": {
            required: false,
            length: 1,
            maxReps: -1,
            dataType: ID
        },
        "pcr22": {
            required: false,
            length: 1,
            maxReps: -1,
            dataType: ID
        },
        "pcr23": {
            required: false,
            length: 1,
            maxReps: -1,
            dataType: ID
        }
    }
}
public type PCR record {
    *hl7v2:Segment;
    string name = PCR_SEGMENT_NAME;
    CE pcr1 = {};
    IS pcr2 = "";
    CE pcr3 = {};
    CQ pcr4 = {};
    TS pcr5 = {};
    TS pcr6 = {};
    TS pcr7 = {};
    TS pcr8 = {};
    IS pcr9 = "";
    CE pcr10 = {};
    IS pcr11 = "";
    ST[] pcr12 = [""];
    IS pcr13 = "";
    CE pcr14 = {};
    CE pcr15 = {};
    CE pcr16 = {};
    ID pcr17 = "";
    TS pcr18 = {};
    ID pcr19 = "";
    ID pcr20 = "";
    ID[] pcr21 = [""];
    ID[] pcr22 = [""];
    ID[] pcr23 = [""];
};

public const PCR_SEGMENT_NAME = "PCR";
