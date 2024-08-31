package com.example.in_app_web_view

import android.os.Bundle
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.appcompat.app.AppCompatActivity

class WebViewActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        // Apply a compatible theme before calling super.onCreate
        setTheme(R.style.Theme_AppCompat_Light_NoActionBar)

        super.onCreate(savedInstanceState)

        val webView = WebView(this)
        webView.settings.javaScriptEnabled = true
        webView.webViewClient = WebViewClient()

        intent.getStringExtra("url")?.let { webView.loadUrl(it) }

        setContentView(webView)
    }
}


