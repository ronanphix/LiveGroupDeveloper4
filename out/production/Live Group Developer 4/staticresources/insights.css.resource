
        body {
            background-image: url("{!$Site.BaseUrl}/_slds/images/themes/lightning_blue/lightning_blue_background.png");
            background-size: 100%;
            background-repeat: no-repeat;
            background-position: top;
            background-color: #B0C4DF;
            background-attachment: fixed;
        }
        .box {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            padding: 10px;
            background-color: white;
            border: 0.5px solid grey;
            margin-bottom: 10px;
            position: relative;
            width: 100%;
        }
        .controlHolder {
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .control {
            display: flex;
            justify-content: center;
        }
        .dateHolder {
            display: flex;
            overflow: hidden;
            font-size: 11px;
            padding-left: 10px;
            padding-right: 10px;
            font-weight: lighter;
            position:absolute;
            left:0;
        }
        .viewOptionHolder {
            display: flex;
            font-size: 15px;
            margin-left: 30px;
            border-radius: 5px;
            overflow: hidden;
        }
        .viewOption {
            padding: 6px;
            padding-left: 10px;
            padding-right: 10px;
            background-color: #d7d7d7;
            font-weight: lighter;
            cursor: pointer;
            opacity: 0.5;
        }
        .viewOption:hover {
            opacity: 1;
        }
        .activeSetting {
            opacity: 1 !important;
            background-color: #c1c1c1;
        }
        .dimmer {
            position: fixed;
            left: 0;
            right: 0;
            bottom: 0;
            top: 0;
            margin: auto;
            height: 100vh;
            width: 100vw;
            background-color: white;
            opacity: 0.75;
        }
        .boxLite {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05), 0 6px 20px 0 rgba(0, 0, 0, 0.05);
            border-radius: 3px;
            padding: 5px;
            background-color: white;
            border: 0.5px solid lightgrey;
            margin:4px;
            position:relative;
        }
        .labelBlock {
            width: 100%;
            text-align: center;
            font-size: 16px;
        }
        .valueBlock {
            position: relative;
            text-align: center;
            justify-content: center;
            align-items: center;
            font-size: 28px;
            margin-bottom: 6px;
        }
        .splitTwo {
            display: grid;
            grid-template-columns: 50% 50%;
        }
        .splitFour {
            display: grid;
            grid-template-columns: 25% 25% 25% 25%;
        }
        .title {
            font-size: 18px;
            display: flex;
        }
        .optionsHolder {
            position: relative;
            width: 100%;
            display: flex;
            justify-content: flex-end;
        }
        .options {
            display: flex;
            border-radius: 3px;
            overflow: hidden;
            width: auto;
            font-size: 11px;
            height: 22px;
        }
        .option {
            padding-top: 4px;
            width: 100px;
            color: white;
            text-align: center;
            cursor: pointer;
            font-weight: lighter;
        }
        .optionLong {
            padding-top: 4px;
            width: 200px;
            color: white;
            text-align: center;
            cursor: pointer;
            font-size: 9px;
            position: relative;
        }
        .miniOptions {
            display: flex;
            font-size: 9px;

        }
        .miniOption {
            width: 50px;
        }
        .inactive {
            opacity : 0.5;
        }
        .report {
            width: 90%;
            height: 90%;
            background-color: white;
        }
        .graph {
            position: relative;
            /*height: 380px;*/
            height: 300px;
        }
        .confirmed {
            background-color: #262d3f;
        }
        .weighted {
            background-color: #2d7175;
        }
        .pipeline{
            background-color: #60c5c1;
        }
        .budget {
            background-color: #575858;
        }
        .target {
            background-color: green;
        }
        .opex{
            background-color: #b86267;
        }
        .budget {
            background-color: #575858;
        }
        .dim {
            opacity : 0.3;
        }
        .customButton{
            border-radius: 10px;
            cursor: pointer;
        }
        .customDates {
            display: flex;
        }
        .customDates > * {
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: center;
            height: 100%;
            padding-left: 6px;
            padding-right: 6px;
            vertical-align: middle;
        }
        .row {
            border-bottom: 0.5px solid lightgrey;
            min-height: 25px;
            position: relative;
            display: flex;
            cursor: default;
        }
        .rowTight {
            width: 100%;
        }
        .rowGrow {
            width: 3800px;
            font-size: 17px;
        }
        .recordRow{
            /*min-height:120px;*/
            min-height:132px;
            position: relative;
        }
        .column {
            margin: 1px;
            margin-right: 5px;
            height: auto;
            min-height: 23px;
            width: 200px;
            padding-left: 5px;
            position: sticky;
            left: 4px;
            background: white ;
            z-index: 501;
            box-shadow: 0 4px 8px 0 rgba(255,255,255, 0.1), 0 6px 20px 0 rgba(255,255,255, 0.1);
        }
        .week {
            margin: 1px;
            height: auto;
            min-height: 23px;
            text-align: right;
            padding-right: 5px;
            position: relative;
            transition: opacity 0.5s;
            transition-property: opacity;

        }
        .weekSmall {
            width: calc((100% - 200px) / 12);
        }
        .weekLarge {
            width: 280px;
        }
        .scroll {
            overflow-x: scroll;
            position: relative;
        }
        .bold {
            font-weight: bold;
        }
        .noSpill {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }



        .flowDate{
            background-color: white;
            position: sticky;
            top: 2px;
        }
        .icon {
            position: absolute;
            right: -7px;
            bottom: -6px;
            opacity: 0.4;
        }
        .iconImg {
            width: 30px;
        }
        .sortable {
            height: 100%;
            position: relative;
            /*z-index: 1;*/

            /*z-index: 1;*/
            /*margin-bottom: 72px;*/
        }
        .largeCol {
            font-weight: bolder;
            color: #b1b1b1;
            width: 200px;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            z-index: 0;
        }
        .manageFlowIcon {
            opacity: 0.3;
            cursor: pointer;
            font-size: 24px;
            margin-left: 5px;
        }
        .manageFlowIcon:hover {
            opacity: 1;
        }
        .dropZone {
            position: absolute;
            width: 100%;
            bottom:0;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
        }
        .dropZoneActive {
            height: 100%;
            border: 0.5px solid #bcbcbc;
            background-image: linear-gradient(to bottom, rgba(255,255,255,0), rgba(255,255,255,1));
            z-index: 1;
        }
        .dropText {
            width: 97%;
            font-weight: bolder;
            opacity: 0.15;
            color: #686868;
            margin-right: 40px;
        }
        .dropTextDate {
            font-size: 21px;
        }
        .dropTextNumber {
            font-size: 34px;
            margin-top: -12px;
        }
        .selectOpt {
            height: 2px;
        }
        .colDivider {
            display: grid;
            grid-template-columns: 5% 6% 15% 13% 8% 8% 10% 10% 10% 7% 8%;
            padding-left: 4px;
            padding-right: 4px;
        }
        .headerDivider {
            display: grid;
            grid-template-columns: 55% 10% 10% 10% 6% 9%;
            padding-left: 4px;
            padding-right: 4px;
        }
        .sourceIndicator {
            position: absolute;
            right: 0;
            bottom: 0;
            font-weight: bold;
            text-align: right;
            opacity: 1;
            font-size: 10px;
            width: 64%;
            padding: 3px;
            color: white;
            border-top-left-radius: 3px;
        }
        .Quickbooks {
        }
        .QuickbooksIndicator {
            color: white;
            background-image: linear-gradient(to right, #fefdfd 40%, green);
        }
        .SalesforceIndicator {
            background-image: linear-gradient(to right, #fefdfd 40% , blue);
        }
        .SalesforcePIndicator {
            background-image: linear-gradient(to right, #fefdfd 40% , grey);
        }
        .BudgetIndicator, .VATIndicator {
            background-image: linear-gradient(to right, #fefdfd 40% , #b1a657);
        }
        .up {
            color: green;
        }
        .upSnap {
            color : #37753c;
        }
        .down {
            color: red;
        }
        .downSnap {
            color: #b86a6a;
        }
        .neutralSnap {
            color: #5e5d5d;
        }
        .yearGrid {
            display: grid;
            grid-template-columns: 13% 6.6% 6.6% 6.6% 6.6% 6.6% 6.6% 6.6% 6.6% 6.6% 6.6% 6.6% 6.6% 8%;
            justify-content: space-evenly;
            font-weight: lighter;
        }
        .yearEntry {
            width:100%;
            padding-right: 4px;
            text-align: right;
        }
        .header {
            font-weight: bold;
        }
        .monthTile {
            /*border-left: 0.5px solid lightgrey;*/
            text-align: right;
            /*padding: 4px;*/
            cursor: pointer;
            position: relative;
        }
        .figureTile:hover {
            background-color: #f2f2f2;
        }
        .reportCols {
            position: sticky;
            top: 0;
            background-color: #c1c1c1;
            /* color: white; */
            padding: 4px;
            z-index: 4;
            /*font-weight: lighter;*/
            padding-left: 9px;
        }
        .reportHeader {
            font-size: 17px;
            padding-left: 9px;
        }
        .reportMonth {
            /*font-weight: bold;*/
            background-color: #262d3f;
            color: white;
            position: sticky;
            top: 27px;
            z-index:3;
        }
        .stage {
            /*padding: 3px;*/
            font-size: 16px;
            /*border-top: 0.5px solid black;*/
            position: sticky;
            top: 51px;
            /*background-color: white;*/
            color: white;
            z-index: 2;
        }
        .reportRecord {
            cursor: pointer;
            border-bottom: 0.5px solid #e4e4e4;
            padding: 3px;
            min-height: 31px;
            color: black;
            font-size: 12px;
            position: relative;
        }
        .reportRecord:hover {
            background-color: #f4f4f4;
        }
        .inheritanceRow {
            cursor: pointer;
            border-bottom: 0.5px solid #e4e4e4;
            padding: 3px;
            min-height: 31px;
            color: black;
            font-size: 12px;
            position: relative;
            /*background-color: #2c7495;*/
        }
        .reportTotals {
            font-size: 16px;
            font-weight: bold;
        }
        .dragPrevent {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: 1000000;
            /*background-color: grey;*/
            background-color: white;
            opacity: 0.8;
        }
        .record {
            margin-top: 2px;
            margin-bottom: -32px;
            width: 100%;
            border-radius: 3px;
            text-align: left;
            background-color: white;
            padding: 5px;
            border: 0.5px solid grey;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05), 0 6px 20px 0 rgba(0, 0, 0, 0.05);
            cursor: pointer;
            display: grid;
            grid-template-columns: 7% 66% 6% 21%;
            position: relative;
            color: black;
            font-size:10px;
            z-index: 1;
        }
        .recordDetails {
            position: absolute;
            margin-top: 9px;
            margin-left: -8px;
            border-radius: 3px;
            width: 100%;
            height: auto;
            padding: 5px;
            z-index: 50;
            background-color: white;
            border: 0.5px solid grey;
            /*box-shadow: 0 4px 8px 0 rgba(255,255,255, 0.4), 0 6px 20px 0 rgba(255,255,255, 0.4);*/
        }
        .recordDetailsHidden {
            display : none;
        }
        .recordOptionButton {
            font-size: 15px;
            margin: 3px;
            padding: 4px;
            background-color: white;
            border: 0.5px solid grey;
            border-radius: 3px;
            position: relative;
            display: grid;
            grid-template-columns: 10% 90%;
        }
        .recordOptionGrid {
            display: grid;
            grid-template-columns: 10% 90%;
        }
        .selectedRecord {
            z-index: 100000000000 !important;
        }
        .recordOptionButton > input {
            border: none;
        }
        .recordOptionButton > .fas, .far {
            padding-top: 3px;
        }
        .recordOptionButton:hover {
            background-color: #f7f7f7;
        }

        .flowOptionButton {
            font-size: 15px;
            margin: 3px;
            padding: 4px;
            background-color: white;
            border: 0.5px solid grey;
            border-radius: 3px;
            cursor: pointer;
        }
        @-webkit-keyframes example {
            from {height: 0;width:0;}
            to {height: auto;width: 100%;}
        }
        @keyframes example {
            from {height: 0px;width:0;}
            to {height: auto;width: 100%;}
        }
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .gapConcealer {
            position: absolute;
            height: 100%;
            width: 20px;
            top:0;
            left:-10px;
            background-color: white;
        }
        .faAbsolute {
            font-size: 17px;
            position: absolute;
            margin-left: 10px;
            margin-bottom: -6px;
            bottom: 13px;
        }
        body textarea, .slds-vf-scope textarea {
            border: 1px solid rgb(255, 255, 255);
            font-size: 13px;
            padding: 1px;
        }

        .ddSetup {
            display: grid;
            grid-template-columns: 40% 60%;
            padding: 5px;
            font-size: 13px;

        }
        body select, body select[size="0"], body select[size="1"],
        .slds-vf-scope select, .slds-vf-scope select[size="0"],
        .slds-vf-scope select[size="1"] {
            border: 1px solid rgb(221, 219, 218);
            max-width: 100%;
            width: 100%;
            border-radius: .25rem;
            background-color: rgb(255, 255, 255);
            color: rgb(8, 7, 7);
            -webkit-transition: border .1s linear, background-color .1s linear;
            transition: border .1s linear, background-color .1s linear;
        }

        .ddSetup > input, .ddSetup > select {
            width: 100%;

        }
        .adjustmentCount {
            position: absolute;
            right: -16px;
            color: white;
            width: 65px;
            height: 65px;
            font-weight: bold;
            border-bottom: 77px solid #b2a5d1;
            border-left: 25px solid transparent;
        }
        .rowContent {
            width: 100%;
            margin-left: -2px;
            position: absolute;
            background-color: white;
            z-index: 4;
            padding: 2px;
            border-radius: 4px;
            border: 0.5px solid grey;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05), 0 6px 20px 0 rgba(0, 0, 0, 0.05);
        }
        .reportFilter {
            display: flex;
            justify-content: center;
            overflow: hidden;
            border-radius: 3px;
            position: relative;
            margin-right:5px;
            margin-left:5px;
        }
        .reportFilterOption {
            cursor: pointer;
            padding: 3px;
            padding-top: 8px;
            padding-bottom: 8px;
            color: white;
        }
        .flowManagerIcons {
            display: flex;
            justify-content: center;
            overflow: hidden;
            border-radius: 3px;
            /*position: absolute;*/
            top: 11px;
            margin-right: 5px;
            font-size: 24px;
            opacity: 0.5;

        }
        .flowManagerIcon {
            padding: 4px;
            border-radius: 4px;
            margin-left:4px;
            cursor: pointer;
        }
        .flowManagerIcon:hover {
            color: white;
            background: grey;
        }

        /*.reportStage {*/
            /*color: white;*/
        /*}*/
        .Closed {
            background-color: #2c7495;
            /*border-left: 5px solid #2c7495;*/
        }
        .Costed {
            background-color: #21a5ab;
            /*border-left: 5px solid #21a5ab;*/
        }
        .Pipeline {
            background-color: #5fc6c3;
            /*border-left: 5px solid #5fc6c3;*/
        }
        .Repeat {
            background-color: #8194bb;
            /*border-left: 5px solid #8194bb;*/
        }
        .Closedborder {
            border-left: 5px solid #2c7495;
        }
        .Costedborder {
            border-left: 5px solid #21a5ab;
        }
        .Pipelineborder {
            border-left: 5px solid #5fc6c3;
        }
        .Repeatborder {
            border-left: 5px solid #8194bb;
        }

        #app {
            width: 100%;
            max-width: 1500px;
            padding: 10px;
            position:relative;
        }

        .fadeIn {
            opacity: 0;
            background-color: white;
        }
        .fadeIn:hover {
            opacity:1;
        }
        .fade {
            -webkit-transition: opacity 0.3s;
            transition: opacity 0.3s;
        }
        .switch {
            font-size: 30px;
            cursor: pointer;
            position: absolute;
        }
        input[type=date]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            display: none;
        }
        .indicator {
            font-weight: bold;
            border-radius: 50%;
            color: white;
            height: 15px;
            width: 15px;
            text-align: center;
        }
        .QuickbooksCircle {
            background-color: green;
        }
        .SalesforceCircle {
            background-color: blue;
        }
        .SalesforcePCircle {
            background-color: grey;
        }
        .BudgetCircle {
            background-color: #b1a657;
        }
        .CustomCircle {
            background-color: #e6a8ff;
        }
        .DirectDebitCircle {
            background-color: black;
        }
        .commentIcon {
            padding-left: 4px;
            font-size: 15px;
            margin-top: -3px;
        }
        .description {
            height: 35px;
        }
        .amount {
            text-align: right;
        }
        .modalBackdrop {
            position: fixed;
            width: 100%;
            height: 100%;
            background-color: white;
            opacity: 0.8;
            z-index: 1000000;
            top:0;
            left:0;
        }
        .newEntryFormHolder {
            position:fixed;
            width:100%;
            display: flex;
            justify-content: center;
            top: 90px;
            z-index: 1000001;
        }
        .newEntryForm {
            width: 360px;
            padding: 10px;
            background-color: white;
            border-radius: 4px;
            border: 0.5px solid grey;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05), 0 6px 20px 0 rgba(0, 0, 0, 0.05);
            z-index: 1000001;
            position: relative;
            font-size: 16px;
        }
        .entryFormTitle {
            width: 100%;
            display: flex;
            justify-content: center;
            font-size: 18px;
            /*font-weight: bold;*/
        }
        .entryGrid {
            display : grid;
            grid-template-columns: 30% 70%;
            margin-top:11px;
        }
        .managerGrid {
            display : grid;
            grid-template-columns: 40% 60%;
            margin-top:11px;
        }

        .recordButtons {
            width: 100%;
            display: flex;
            justify-content: center;
            /* grid-template-columns: 50% 50%; */
            color: white;
            font-size: 18px;
            cursor: pointer;
            padding: 1px;
        }
        .recordButtonsSmall {
            position: relative !important;
            font-size: 15px !important;
        }
        .recordButton {
            height: 36px;
            width: 90%;
            display: flex;
            justify-content: center;
            padding-top: 4px;
            border-radius: 7px;
            /* padding: 5px; */
            margin: 5px;
        }
        .recordButtonSmall {
            height: 30px !important;
        }
        .recordButtonIcon {
            padding-top: 4px;
        }
        .save {
            background-color: #9f9d9d;
        }
        .cancel {
            background-color: #cecccc;
        }
        .save:hover {
            background-color: #2d7175;
        }
        .cancel:hover {
            background-color: #60c5c1;
        }
        .flowTypeIndicator {
            /*font-size: 83px;*/
            /*font-size: 75px;*/
            font-size: 63px;
            opacity: 0.2;
            position: absolute;
            /*bottom: -18px;*/
            top: -18px;
            width: 100vw;
        }
        .warnText {
            padding: 5px;
            font-size: 12px;
        }
        .amountInput {
            width: 100%;
            padding-left: 4px;
            border-radius: 4px;
            border: 1px solid lightgrey;
            height: 26px;
        }
        .loader {
            color: black;
            font-size: 90px;
            text-indent: -9999em;
            overflow: hidden;
            width: 1em;
            height: 1em;
            border-radius: 50%;
            margin: 72px auto;
            position: fixed;
            left: 46%;
            top: 23%;
            z-index: 10000000000;
            -webkit-transform: translateZ(0);
            -ms-transform: translateZ(0);
            transform: translateZ(0);
            -webkit-animation: load6 1.7s infinite ease, round 1.7s infinite ease;
            animation: load6 1.7s infinite ease, round 1.7s infinite ease;
        }
        @-webkit-keyframes load6 {
            0% {box-shadow: 0 -0.83em 0 -0.4em, 0 -0.83em 0 -0.42em, 0 -0.83em 0 -0.44em, 0 -0.83em 0 -0.46em, 0 -0.83em 0 -0.477em;}
            5%,
            95% {box-shadow: 0 -0.83em 0 -0.4em, 0 -0.83em 0 -0.42em, 0 -0.83em 0 -0.44em, 0 -0.83em 0 -0.46em, 0 -0.83em 0 -0.477em;}
            10%,
            59% {box-shadow: 0 -0.83em 0 -0.4em, -0.087em -0.825em 0 -0.42em, -0.173em -0.812em 0 -0.44em, -0.256em -0.789em 0 -0.46em, -0.297em -0.775em 0 -0.477em;}
            20% {box-shadow: 0 -0.83em 0 -0.4em, -0.338em -0.758em 0 -0.42em, -0.555em -0.617em 0 -0.44em, -0.671em -0.488em 0 -0.46em, -0.749em -0.34em 0 -0.477em;}
            38% {box-shadow: 0 -0.83em 0 -0.4em, -0.377em -0.74em 0 -0.42em, -0.645em -0.522em 0 -0.44em, -0.775em -0.297em 0 -0.46em, -0.82em -0.09em 0 -0.477em;}
            100% {box-shadow: 0 -0.83em 0 -0.4em, 0 -0.83em 0 -0.42em, 0 -0.83em 0 -0.44em, 0 -0.83em 0 -0.46em, 0 -0.83em 0 -0.477em;}
        }
        @keyframes load6 {
            0% {box-shadow: 0 -0.83em 0 -0.4em, 0 -0.83em 0 -0.42em, 0 -0.83em 0 -0.44em, 0 -0.83em 0 -0.46em, 0 -0.83em 0 -0.477em;}
            5%,
            95% {box-shadow: 0 -0.83em 0 -0.4em, 0 -0.83em 0 -0.42em, 0 -0.83em 0 -0.44em, 0 -0.83em 0 -0.46em, 0 -0.83em 0 -0.477em;}
            10%,
            59% {box-shadow: 0 -0.83em 0 -0.4em, -0.087em -0.825em 0 -0.42em, -0.173em -0.812em 0 -0.44em, -0.256em -0.789em 0 -0.46em, -0.297em -0.775em 0 -0.477em;}
            20% {box-shadow: 0 -0.83em 0 -0.4em, -0.338em -0.758em 0 -0.42em, -0.555em -0.617em 0 -0.44em, -0.671em -0.488em 0 -0.46em, -0.749em -0.34em 0 -0.477em;}
            38% {box-shadow: 0 -0.83em 0 -0.4em, -0.377em -0.74em 0 -0.42em, -0.645em -0.522em 0 -0.44em, -0.775em -0.297em 0 -0.46em, -0.82em -0.09em 0 -0.477em;}
            100% {box-shadow: 0 -0.83em 0 -0.4em, 0 -0.83em 0 -0.42em, 0 -0.83em 0 -0.44em, 0 -0.83em 0 -0.46em, 0 -0.83em 0 -0.477em;}
        }
        @-webkit-keyframes round {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        @keyframes round {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        .pendingMessage {
            position: fixed;
            top: 58%;
            left: 0;
            color: black;
            z-index: 10000000000;
            font-size: 24px;
            width: 100%;
            display: flex;
            justify-content: center;
            text-align: center;
        }
        .probabilityIndicator {
            position: absolute;
            left: 0;
            top: 0;
            border-bottom: 1px solid grey;
            text-align: right;
            /*padding-right: 2px;*/
            /*text-shadow: 0px 0px 2px #000000;*/
            /*color: white;*/
        }
        .recIndicator {
            position: absolute;
            left: 0;
            top: 0;
            display: flex;
            width: 100%;
            height: 15px;
        }
        .recCostOfSale {
            background-color: #f0b4b6;
            height: 100%;
        }
        .recProfit {
            background-color: #04ca04;
            height: 100%;
        }
        .hiddenTab {
            position: absolute;
            left: -1000%;
        }
        .hiddenTabLong {
            position: absolute;
            left: -1000%;
            width: 98%;
            max-width:1500px;
        }

        .billframe {
            position: fixed;
            top: 0;
            padding-top:30px;
            left:0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            z-index: 1000000000000;
        }
        .billframeHidden {
            display : none;
        }
        .manageIcon {
            position: absolute;
            top: 6px;
        }
        .triangle-right {
            width: 0;
            height: 0;
            border-top: 25px solid transparent;
            border-left: 20px solid #555;
            border-bottom: 25px solid transparent;
            position:absolute;
            right:-20px;
            top:0;
        }
        .historyIcon {
            margin-right: 8px;
            margin-left: 5px;
            font-size: 24px;
            opacity:0.5;
            cursor:pointer;
            padding: 4px;
            border-radius: 4px;
            -webkit-transition: opacity 0.5s;
            transition: opacity 0.5s;
        }
        .historyIcon:hover {
            color: white;
            background: grey;
        }
        .snpashotFade {
            -webkit-transition: opacity 0.5s;
            transition: opacity 0.5s;
        }
        .snapshotText {
            margin-left: 8px;
            opacity: 0.8;
            cursor:pointer;
            padding-left:4px;
            padding-right:4px;
            border-radius: 4px;
            background-color: grey;
            color:white;
            -webkit-transition: opacity 0.5s;
            transition: opacity 0.5s;
        }
        .snapshotGraph {
            -webkit-transition: opacity 0.5s;
            transition: opacity 0.5s;
            margin-top:-51.8%;
        }
        .snapshotIcon {
            -webkit-transition: opacity 0.5s;
            transition: opacity 0.5s;
            position: absolute;
            top: 10px;
            left: 70px;
            font-size: 40px;
            opacity: 0.3;
        }
        .forbidden {
            background-color: lightcoral;
        }
        .faflow {
            color: grey;
            font-size: 12px;
        }
        .imageText {
            height: 25px;
            width: 25px;
            background-color: #c7c5c5;
            border-radius: 50%;
            color: white;
            font-size: 14px;
            text-align: center;
            padding-top: 2px;
            font-weight: bold;
        }
        .selectedTile {
            font-weight: bold;
            /*background-color: lightgrey;*/
        }
        .controlRight {
            position:absolute;
            right:10px;
            top:4px;
            background-color: white;
            border-radius: 12px;
            padding:5px;
            display: flex;
            flex-direction: row-reverse;
            cursor: pointer;
        }
        .controlRightBordered {
            border: 0.5px solid lightgrey;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05), 0 6px 20px 0 rgba(0, 0, 0, 0.05);
            -webkit-transition: opacity 0.5s;
            transition: opacity 0.5s;
            opacity: 0.6;
        }
        .controlRightBordered:hover {
            opacity: 1;
        }
        .reportIcon {
            opacity: 0.5;
        }
        .ageIndicator {
            color: white;
            padding-left: 2px;
            padding-right: 2px;
            border-radius: 2px;
            margin-right: 3px;
            text-align: center;
        }
        .newIndicator {
            background-color: green;
        }
        .oldIndicator {
            background-color: grey;
        }
        .stageHistoryBlock {
            height:100%;
            position:absolute;
            right:0;
            top:0;
            background-color: white;
        }
        .REPEAT {
            background-image: linear-gradient(rgb(129, 148, 187), rgba(255, 255, 255, 0));
        }
        .REPEATline {
            background-color: rgb(129, 148, 187);
        }
        .PIPELINE {
            background-image: linear-gradient(rgb(95, 197, 194), rgba(255, 255, 255, 0));
        }
        .PIPELINEline {
            background-color: rgb(95, 197, 194);
        }
        .COSTED {
            background-image: linear-gradient(rgb(33, 164, 170), rgba(255, 255, 255, 0));
        }
        .COSTEDline {
            background-color: rgb(33, 164, 170);
        }
        .CLOSED {
            background-image: linear-gradient(rgb(44, 116, 148), rgba(255, 255, 255, 0));
        }
        .CLOSEDline {
            background-color: rgb(44, 116, 148);
        }
        .RECONCILIATION {
            background-image: linear-gradient(rgb(211, 59, 142), rgba(255, 255, 255, 0));
        }
        .RECONCILIATIONline {
            background-color: rgb(211, 59, 142);
        }
        .changeGrid {
            display: grid;
            grid-template-columns:70% 10% 10% 10%;
        }
        .changeRow {
            min-height:30px;
            cursor:pointer;
            padding: 4px;
        }
        .changeRow:hover {
            background-color: #f9f9f9;
        }
        .dayChangeFigure {
            background-color: white;
            padding-left: 3px;
            padding-right:3px;
        }
        .oppHistoryRecord {
            position:absolute;
            top:82px;
            right:0;
            font-size:17px;
            /*z-index: 1;*/
        }
        .oppHistoryIcon {
            position:absolute;
            z-index:1;
            opacity:0.5;
            cursor:pointer;
        }
        .oppHistoryIcon:hover {
            opacity: 1;
            z-index:10;
            font-size:21px;

        }