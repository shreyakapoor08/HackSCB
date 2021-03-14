import 'package:shake/shake.dart';
import 'package:call_number/call_number.dart';

//function for shake detector


void onShake()
{

return ShakeDetector.autoStart(
      onPhoneShake: (){

        var text = '112';
        CallNumber().callNumber(text);
      },
    );
}
