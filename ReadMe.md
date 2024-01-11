# Quai Network

## Sistem Gereksinimleri

* CPU 8+ Cores
* 32GB+ RAM
* 2TB SSD
* 10+ MBit/sec Internet service

** Sunucu için Hetzner AX41 2TB öneriyoruz.  **

<a href="https://www.hetzner.com/dedicated-rootserver/matrix-ax"> Hetzner AX41 </a>

1. Kullanıcı adı ve şifre almak için https://stats.colosseum.quai.network/ adresini ziyaret edin. Mail adresinize gönderilen Signup anahtarınız yalnızca bir kez çalışacaktır! Bu anahtarı gönderirken oluşturduğunuz kullanıcı adı ve şifreyi sakladığınızdan emin olun.
 
2. https://koalawallet.io/ adresinden Koala Wallet'ı kullanarak Quai adresi alın.

3. Daha sonra windows için putty programını kullanarak bağlanın , mac os için ise terminalden ssh root@ipadresi şeklinde bağlabilirsiniz. 

4. Kurulum scriptini çalıştırıp cüzdan adresinizle birlikte , Name ve password verilerini girin

<pre class="notranslate"><code>wget -O setup.sh https://raw.githubusercontent.com/Whale-Alpha/Quai-Guide/main/setup.sh && chmod +x setup.sh && ./setup.sh
</code></pre>

 
5. Node'unuzun orada olup olmadığını kontrol etmek için https://stats.quai.network/ adresine bakın!
