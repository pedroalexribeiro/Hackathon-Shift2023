// the button to connect to an ethereum wallet
const buttonEthConnect = document.querySelector('input.eth_connect');
console.log(buttonEthConnect);
// the read-only eth fields, we process them automatically
const formInputEthMessage = document.querySelector('input.eth_message');
console.log(formInputEthMessage);
const formInputEthAddress = document.querySelector('input.eth_address');
console.log(formInputEthAddress);

const formInputEthSignature = document.querySelector('input.eth_signature');
console.log(formInputEthSignature);

// get the new session form for submission later
const formNewSession = document.querySelector('form');
// only proceed with ethereum context available
if (typeof window.ethereum !== 'undefined') {
  buttonEthConnect.addEventListener('click', async () => {
    // request accounts from ethereum provider
    const accounts = await requestAccounts();
    const etherbase = accounts[0];
    // sign a message with current time and nonce from database
    const nonce = await getUuidByAccount(etherbase);
    console.log("i submit tho");
    if (nonce) {
      const customTitle = "Ethereum on Rails";
      const requestTime = new Date().getTime();
      const message = customTitle + "," + requestTime + "," + nonce;
      const signature = await personalSign(etherbase, message);
      // populate and submit form
      formInputEthMessage.value = message;
      formInputEthAddress.value = etherbase;
      formInputEthSignature.value = signature;
      formNewSession.submit();
    }
  });
}


// request ethereum wallet access and approved accounts[]
async function requestAccounts() {
  const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
  return accounts;
}

// request ethereum signature for message from account
async function personalSign(account, message) {
  const signature = await ethereum.request({ method: 'personal_sign', params: [ message, account ] });
  return signature;
}

// get nonce from /api/v1/users/ by account
async function getUuidByAccount(account) {
  const response = await fetch("/api/v1/users/" + account);
  const nonceJson = await response.json();
  if (!nonceJson) return null;
  const uuid = nonceJson[0].eth_nonce;
  return uuid;
}