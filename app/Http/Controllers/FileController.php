<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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

    public function uploadAttach(Request $request)
    {
        $file = $request->file('file');
        if(empty($file)){
            return response()->json('no_file',400);
        }
        $now = microtime(true)*10000;
        $newFileName = $now.'_attach.'.$file->getClientOriginalExtension();
        $originName = $file->getClientOriginalName();
        $size = $file->getSize();
        DB::table('attach_files')->insert([
            'file_name'=>$originName,
            'file_path'=>$newFileName,
            'file_size'=>$size,
            'created_at'=>date('Y-m-d H:i:s')
        ]);

        $file->storePubliclyAs('/attach/',$newFileName);


        return response()->json($newFileName);
    }

    public function get_attach_files(Request $request){
        $result = DB::table('attach_files')->get();
        return response()->json($result);
    }
}
