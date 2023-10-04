
"use strict";

let CfgGNSS = require('./CfgGNSS.js');
let EsfRAW = require('./EsfRAW.js');
let NavSTATUS = require('./NavSTATUS.js');
let Inf = require('./Inf.js');
let NavPVT7 = require('./NavPVT7.js');
let CfgNAVX5 = require('./CfgNAVX5.js');
let EsfMEAS = require('./EsfMEAS.js');
let RxmRAW = require('./RxmRAW.js');
let RxmRAWX = require('./RxmRAWX.js');
let NavVELNED = require('./NavVELNED.js');
let AidEPH = require('./AidEPH.js');
let NavRELPOSNED = require('./NavRELPOSNED.js');
let CfgUSB = require('./CfgUSB.js');
let RxmSFRBX = require('./RxmSFRBX.js');
let UpdSOS_Ack = require('./UpdSOS_Ack.js');
let RxmRTCM = require('./RxmRTCM.js');
let NavPOSECEF = require('./NavPOSECEF.js');
let CfgNMEA6 = require('./CfgNMEA6.js');
let NavDOP = require('./NavDOP.js');
let NavSVINFO_SV = require('./NavSVINFO_SV.js');
let CfgNMEA7 = require('./CfgNMEA7.js');
let CfgANT = require('./CfgANT.js');
let MonGNSS = require('./MonGNSS.js');
let CfgINF = require('./CfgINF.js');
let EsfSTATUS = require('./EsfSTATUS.js');
let CfgTMODE3 = require('./CfgTMODE3.js');
let NavSVIN = require('./NavSVIN.js');
let NavDGPS = require('./NavDGPS.js');
let MgaGAL = require('./MgaGAL.js');
let NavSVINFO = require('./NavSVINFO.js');
let MonHW = require('./MonHW.js');
let NavSOL = require('./NavSOL.js');
let RxmSFRB = require('./RxmSFRB.js');
let EsfRAW_Block = require('./EsfRAW_Block.js');
let NavTIMEUTC = require('./NavTIMEUTC.js');
let CfgMSG = require('./CfgMSG.js');
let CfgRATE = require('./CfgRATE.js');
let EsfSTATUS_Sens = require('./EsfSTATUS_Sens.js');
let NavTIMEGPS = require('./NavTIMEGPS.js');
let AidALM = require('./AidALM.js');
let NavDGPS_SV = require('./NavDGPS_SV.js');
let CfgNAV5 = require('./CfgNAV5.js');
let HnrPVT = require('./HnrPVT.js');
let NavVELECEF = require('./NavVELECEF.js');
let CfgDAT = require('./CfgDAT.js');
let CfgCFG = require('./CfgCFG.js');
let CfgRST = require('./CfgRST.js');
let NavCLOCK = require('./NavCLOCK.js');
let TimTM2 = require('./TimTM2.js');
let NavSAT_SV = require('./NavSAT_SV.js');
let CfgPRT = require('./CfgPRT.js');
let CfgDGNSS = require('./CfgDGNSS.js');
let UpdSOS = require('./UpdSOS.js');
let RxmSVSI_SV = require('./RxmSVSI_SV.js');
let MonHW6 = require('./MonHW6.js');
let NavATT = require('./NavATT.js');
let NavPVT = require('./NavPVT.js');
let CfgINF_Block = require('./CfgINF_Block.js');
let CfgHNR = require('./CfgHNR.js');
let RxmSVSI = require('./RxmSVSI.js');
let RxmALM = require('./RxmALM.js');
let CfgNMEA = require('./CfgNMEA.js');
let NavSBAS = require('./NavSBAS.js');
let Ack = require('./Ack.js');
let NavSAT = require('./NavSAT.js');
let RxmRAWX_Meas = require('./RxmRAWX_Meas.js');
let CfgSBAS = require('./CfgSBAS.js');
let RxmEPH = require('./RxmEPH.js');
let RxmRAW_SV = require('./RxmRAW_SV.js');
let EsfINS = require('./EsfINS.js');
let MonVER_Extension = require('./MonVER_Extension.js');
let NavPOSLLH = require('./NavPOSLLH.js');
let MonVER = require('./MonVER.js');
let NavSBAS_SV = require('./NavSBAS_SV.js');
let AidHUI = require('./AidHUI.js');
let CfgGNSS_Block = require('./CfgGNSS_Block.js');

module.exports = {
  CfgGNSS: CfgGNSS,
  EsfRAW: EsfRAW,
  NavSTATUS: NavSTATUS,
  Inf: Inf,
  NavPVT7: NavPVT7,
  CfgNAVX5: CfgNAVX5,
  EsfMEAS: EsfMEAS,
  RxmRAW: RxmRAW,
  RxmRAWX: RxmRAWX,
  NavVELNED: NavVELNED,
  AidEPH: AidEPH,
  NavRELPOSNED: NavRELPOSNED,
  CfgUSB: CfgUSB,
  RxmSFRBX: RxmSFRBX,
  UpdSOS_Ack: UpdSOS_Ack,
  RxmRTCM: RxmRTCM,
  NavPOSECEF: NavPOSECEF,
  CfgNMEA6: CfgNMEA6,
  NavDOP: NavDOP,
  NavSVINFO_SV: NavSVINFO_SV,
  CfgNMEA7: CfgNMEA7,
  CfgANT: CfgANT,
  MonGNSS: MonGNSS,
  CfgINF: CfgINF,
  EsfSTATUS: EsfSTATUS,
  CfgTMODE3: CfgTMODE3,
  NavSVIN: NavSVIN,
  NavDGPS: NavDGPS,
  MgaGAL: MgaGAL,
  NavSVINFO: NavSVINFO,
  MonHW: MonHW,
  NavSOL: NavSOL,
  RxmSFRB: RxmSFRB,
  EsfRAW_Block: EsfRAW_Block,
  NavTIMEUTC: NavTIMEUTC,
  CfgMSG: CfgMSG,
  CfgRATE: CfgRATE,
  EsfSTATUS_Sens: EsfSTATUS_Sens,
  NavTIMEGPS: NavTIMEGPS,
  AidALM: AidALM,
  NavDGPS_SV: NavDGPS_SV,
  CfgNAV5: CfgNAV5,
  HnrPVT: HnrPVT,
  NavVELECEF: NavVELECEF,
  CfgDAT: CfgDAT,
  CfgCFG: CfgCFG,
  CfgRST: CfgRST,
  NavCLOCK: NavCLOCK,
  TimTM2: TimTM2,
  NavSAT_SV: NavSAT_SV,
  CfgPRT: CfgPRT,
  CfgDGNSS: CfgDGNSS,
  UpdSOS: UpdSOS,
  RxmSVSI_SV: RxmSVSI_SV,
  MonHW6: MonHW6,
  NavATT: NavATT,
  NavPVT: NavPVT,
  CfgINF_Block: CfgINF_Block,
  CfgHNR: CfgHNR,
  RxmSVSI: RxmSVSI,
  RxmALM: RxmALM,
  CfgNMEA: CfgNMEA,
  NavSBAS: NavSBAS,
  Ack: Ack,
  NavSAT: NavSAT,
  RxmRAWX_Meas: RxmRAWX_Meas,
  CfgSBAS: CfgSBAS,
  RxmEPH: RxmEPH,
  RxmRAW_SV: RxmRAW_SV,
  EsfINS: EsfINS,
  MonVER_Extension: MonVER_Extension,
  NavPOSLLH: NavPOSLLH,
  MonVER: MonVER,
  NavSBAS_SV: NavSBAS_SV,
  AidHUI: AidHUI,
  CfgGNSS_Block: CfgGNSS_Block,
};
