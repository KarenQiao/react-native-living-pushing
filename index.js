import React, { Component } from 'react';
import { requireNativeComponent,NativeModules } from 'react-native';
// import console = require('console');


console.log(`native Components : ${JSON.stringify(Object.keys(NativeModules))}`)
const AliLivingPusher =  requireNativeComponent('AliLivingPusher',null);
// const UATTemp = requireNativeComponent('UATTempMan',null);


/**
 * startPreview
 */

export {AliLivingPusher}
