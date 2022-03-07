<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FileController extends Controller
{

    public function uploadCustomerAttach(Request $request)
    {
        $file = $request->file('file');
        $now = microtime(true)*10000;
        $newFileName = $now.'_attach.'.$file->getClientOriginalExtension();
        $file->storePubliclyAs('/',$newFileName);
        return response()->json($newFileName);
    }

    public function uploadInvoiceLogo(Request $request)
    {
        $file = $request->file('file');
        $now = microtime(true)*10000;
        $newFileName = $now.'_preset.'.$file->getClientOriginalExtension();
        $file->storePubliclyAs('/invoice/',$newFileName);
        return response()->json($newFileName);
    }
}
