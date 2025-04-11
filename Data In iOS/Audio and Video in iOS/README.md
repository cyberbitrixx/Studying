## Audio & Video in iOS

#### Core Frameworks:
* **AVFoundation** - for low-level control over audio and video
* **AVKit** - higher-level, easier to use for basic video-playback

Note: AV stands for "audiovisual".

### Using AVFoundation and AVKit
1. In app project, go to Build Phases
2. Choose Link Binary With Libraries from the list
3. Click "+" and choose AVFoundation and AVKit from the list

### Media formats
To let the AVFoundation and AVKit and UI elements access the media files they should be of the following formats:
* Audio - mp3
* Video - mp4


## Implementation
1. Initialize AVPlayerViewCOntroller - view controller wrapping the media plaer we will create for accessing default iPhone media player:
2. Initialize AVPlayer class instance - used to access the player functionality (play, pause, forward, backward, volume and etc.). It's if we were saying "load my content with this player":
3. Pass the media path to the playerOption:

``` swift
let mediaPlayer = AVPlayerViewController()
var playerOption = AVPlayer()
playerOption = AVPlayer(url: filePath) // Considering the media file path is initialized somewhere above and is held within filePath constant
mediaPlayer.player = playerOption
 ```

4. Showing and using the player (combining with animation methods in UIKit):
``` swift
present(mediaPlayer, animated: true, completion: {
mediaPlayer.player?.play()
})
 ```
Here, you're presenting the player modally, animating it, and telling it to start playback once the view is fully shown.

## Clarification: Who Provides What?

Let’s map the exact components you're using:
| Component | Belongs to | Purpose |
|-|-|-|
| AVPlayerViewController | AVKit | Gives you the built-in player UI — handles playback controls, etc. |
| AVPlayer | AVFoundation | The engine behind playing media (audio/video). |
| AVPlayerItem, AVAudioSession | AVFoundation | Advanced use cases — managing audio sessions, buffering, etc. |

## AVAudioPlayer
Is part of AVFoundation and is used for playing local audio files that are already in the project and don't need streaming from the Internet.
**Example:** button sounds, background ambient etc.

### Implementation
``` swift
import UIKit
import AVFoundation

class MyViewController: UIViewController {
var audioPlayer = AVAudioPlayer()?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        playLocalAudio()
    }
func playLocalAudio() {
    guard let url = Bundle.main.url(forResource: "sondtrack", withExtension: ".mp3") else {
      print("Audio file not found")
      return
    }
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.prepareToPlay()
      audioPlayer?.play()
    } catch {
      print("Failed to initialize audio player: \(error)")
    }
  }
}
 ```

### Must-knows
``` swift
Bundle.main.url(...) // Locates the file in the project
 ```
``` swift
AVAudioPlayer(contentsOf:) // Loads the audio file
 ```
``` swift
prepareToPlay() // Prepares buffers before playing to reduce latency
 ```
``` swift
play(), pause(), stop() // Basic playback controls
 ```
``` swift
audioPlayer?.numberOfLoops = -1 // Loop infinitely, good for ambient background music
 ```
``` swift
volume // Set volume (0.0 to 1.0)
 ```
``` swift
delegate // Use this to know when finishes playing
 ```
 <br><br>

Created by Sophie Shchukina, April 2025.
