package com.example.feburary_flutter

import android.app.Activity
import android.content.Intent
import com.weipl.checkout.WLCheckoutActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.json.JSONArray
import org.json.JSONObject

class MainActivity: FlutterActivity() {

    private val CHANNEL = "samples.flutter.dev/mychannel"
    private val METHOD = "apicall"
    private var result1: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
//        WLCheckoutActivity.setPaymentResponseListener( )
        WLCheckoutActivity.preloadData(applicationContext)
        makeAPICall(flutterEngine)
    }

    private fun makeAPICall(flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->


            val (reqJson, jsonConsumerData) = initialisationOfConsumerData()

            reqJson.put("consumerData", jsonConsumerData)
            WLCheckoutActivity.open(this, reqJson)

            result1 = result
        }
    }

    private fun initialisationOfConsumerData(): Pair<JSONObject, JSONObject> {
        val reqJson = JSONObject()

        val jsonFeatures = JSONObject()
        jsonFeatures.put("enableAbortResponse", true)
        jsonFeatures.put("enableExpressPay", true)
        jsonFeatures.put("enableMerTxnDetails", true)
        jsonFeatures.put("siDetailsAtMerchantEnd", true)
        jsonFeatures.put("enableSI", true)
        reqJson.put("features", jsonFeatures)


        val jsonConsumerData = JSONObject()
        jsonConsumerData.put(
            "deviceId",
            "AndroidSH2"
        ) //possible values "AndroidSH1" or "AndroidSH2"

        jsonConsumerData.put(
            "token",
            "80018aa2c68c4f4fef28565169dc7a1cd48f825b600e77f4193eda1a5d3f0d03900344500271d4e763b7e7232a750669fec9e5b11fde09ab96d151af87993638"
        )
        jsonConsumerData.put("paymentMode", "netBanking")
        jsonConsumerData.put(
            "merchantLogoUrl",
            "https://www.paynimo.com/CompanyDocs/company-logo-vertical.png"
        )
        jsonConsumerData.put("merchantId", "L3348")
        jsonConsumerData.put("currency", "INR")
        jsonConsumerData.put("consumerId", "c964634")
        jsonConsumerData.put("txnId", "1708068755997")
        val jArrayItems = JSONArray()
        val jsonItem1 = JSONObject()
        jsonItem1.put("itemId", "first")
        jsonItem1.put("amount", "1")
        jsonItem1.put("comAmt", "0")
        jArrayItems.put(jsonItem1)
        jsonConsumerData.put("items", jArrayItems)
        val jsonCustomStyle = JSONObject()
        jsonCustomStyle.put("PRIMARY_COLOR_CODE", "#45beaa")
        jsonCustomStyle.put("SECONDARY_COLOR_CODE", "#ffffff")
        jsonCustomStyle.put("BUTTON_COLOR_CODE_1", "#2d8c8c")
        jsonCustomStyle.put("BUTTON_COLOR_CODE_2", "#ffffff")
        jsonConsumerData.put("customStyle", jsonCustomStyle)
        //jsonConsumerData.put("accountNo", "******1111");    //Pass this if accountNo is captured at merchant side for eMandate/eNACH
        //jsonConsumerData.put("accountHolderName", "Name");    //Pass this if accountHolderName is captured at merchant side for ICICI eMandate & eNACH registration this is mandatory field, if not passed from merchant Customer need to enter in Checkout UI.
        //jsonConsumerData.put("ifscCode", "ICIC0000001");    //Pass this if ifscCode is captured at merchant side.
        //jsonConsumerData.put("accountNo", "******1111");    //Pass this if accountNo is captured at merchant side for eMandate/eNACH
        //jsonConsumerData.put("accountHolderName", "Name");    //Pass this if accountHolderName is captured at merchant side for ICICI eMandate & eNACH registration this is mandatory field, if not passed from merchant Customer need to enter in Checkout UI.
        //jsonConsumerData.put("ifscCode", "ICIC0000001");    //Pass this if ifscCode is captured at merchant side.
        jsonConsumerData.put(
            "accountType",
            "Saving"
        ) //Required for eNACH registration this is mandatory field

        jsonConsumerData.put("debitStartDate", "10-03-2019")
        jsonConsumerData.put("debitEndDate", "01-03-2047")
        jsonConsumerData.put("maxAmount", "100")
        jsonConsumerData.put("amountType", "M")
        jsonConsumerData.put(
            "frequency",
            "ADHO"
        ) //  Available options DAIL, WEEK, MNTH, QURT, MIAN, YEAR, BIMN and ADHO
        return Pair(reqJson, jsonConsumerData)
    }


    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == Activity.RESULT_OK) {
            val data1 = data?.getStringExtra("data") ?: ""
            result1?.success(data1)
        }
    }

}
