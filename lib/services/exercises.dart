// import 'package:flutter/material.dart';
// import '../components/custom_exercise_inkwell.dart';

// List exercisesTypes = [
//   CustomExerciseInkWell(
//     height: 140,
//     image: 'assets/Exercises/Chest/background.jpg',
//     title: 'chest',
//     textBackgroundColor: Colors.black.withOpacity(0.5),
//     textColor: Colors.white,
//   ),
//   CustomExerciseInkWell(
//     height: 140,
//     image: 'assets/Exercises/Back/background.jpg',
//     title: 'back',
//     textBackgroundColor: Colors.black.withOpacity(0.5),
//     textColor: Colors.white,
//   ),
//   CustomExerciseInkWell(
//     height: 140,
//     image: 'assets/Exercises/Shoulders/background.jpeg',
//     title: 'shoulders',
//     textBackgroundColor: Colors.black.withOpacity(0.5),
//     textColor: Colors.white,
//   ),
//   CustomExerciseInkWell(
//     height: 140,
//     image: 'assets/Exercises/Arm/background.jpg',
//     title: 'arm',
//     textBackgroundColor: Colors.black.withOpacity(0.5),
//     textColor: Colors.white,
//   ),
//   CustomExerciseInkWell(
//     height: 140,
//     image: 'assets/Exercises/Legs/background.jpg',
//     title: 'legs',
//     textBackgroundColor: Colors.black.withOpacity(0.5),
//     textColor: Colors.white,
//   ),
// ];

// List<ExerciseModel> chestExercises = [
//   ExerciseModel(
//     img: 'assets/Exercises/Chest/Thumbnails/male-barbell-bench-press-front.png',
//     name: 'Barbell Bench Press Front',
//     video: 'assets/Exercises/Chest/Videos/male-barbell-bench-press-front.mp4',
//     steps: [
//       '1.Lay flat on the bench with your feet on the ground. With straight arms unrack the bar.',
//       '2.Lower the bar to your mid chest.',
//       '3.Raise the bar until you\'ve locked your elbows.',
//     ],
//   ),
//   ExerciseModel(
//     img: 'assets/Exercises/Chest/Thumbnails/male-barbell-incline-bench-press-side.png',
//     name: 'Barbell Incline Bench Press side',
//     video: 'assets/Exercises/Chest/Videos/male-barbell-incline-bench-press-side.mp4',
//     steps: [
//       '1.Position the bench between 30 and 45 degrees.',
//       '2.Lay flat on the bench with your feet on the ground. With straight arms unrack the bar.',
//       '3.Lower the bar to your mid chest.',
//       '4.Raise the bar (slowly and controlled) until you\'ve locked your elbows.',
//     ],
//   ),
//   ExerciseModel(
//     img: 'assets/Exercises/Chest/Thumbnails/male-cable-chestpress-front.png',
//     name: 'Cable Chest Press Front',
//     video: 'assets/Exercises/Chest/Videos/male-cable-chestpress-front.mp4',
//     steps: [
//       '1.Use a handle attachment. The cables should be set to shoulder height.',
//       '2.Bring both of the handles to your chest and make sure you are in the center of the cable crossover.',
//       '3.Walk a few steps forward. Then press the weight forward.',
//       '4.From there, you should flex and extend at both the shoulders and elbows simultaneously.',
//     ],
//   ),
//   ExerciseModel(img: 'assets/Exercises/Chest/Thumbnails/male-cable-pec-fly-front.png', name: 'Cable Pec Fly Front', video: 'assets/Exercises/Chest/Videos/male-cable-pec-fly-front.mp4', steps: [
//     '1.Use a handle attachment set all the way to the bottom of the machine.',
//     '2.Bring both of the handles to your chest and make sure you are in the center of the cable crossover.',
//     '3.Walk a few steps forward. Then press the weight forward. From there, your shoulders should horizontally abduct and adduct while your elbows stay in a fixed position.',
//   ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Chest/Thumbnails/male-dumbbell-bench-press-side.png',
//       name: 'Dumbbell Bench Press Side',
//       video: 'assets/Exercises/Chest/Videos/male-dumbbell-bench-press-side.mp4',
//       steps: [
//         '1.Lay flat on the bench with your feet on the ground. Raise the dumbbells until you have straight arms.',
//         '2.Lower the dumbbells to your mid chest.',
//         '3.Raise the dumbbells until you\'ve locked your elbows.',
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Chest/Thumbnails/male-dumbbell-incline-bench-press-front.png',
//       name: 'Dumbbell Incline Bench Press Front',
//       video: 'assets/Exercises/Chest/Videos/male-dumbbell-incline-bench-press-front.mp4',
//       steps: [
//         '1.Raise the bench to a 30 - 45 degree angle.',
//         '2.Lay on the bench and set your feet on the ground.',
//         '3.Raise the dumbbells with straight arms then slowly lower them to about shoulder width.',
//         '4.Raise them again until your arms are locked and at the starting position again.',
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Chest/Thumbnails/male-dumbbell-incline-chest-flys-front.png',
//       name: 'Dumbbell Incline Bench Press Front',
//       video: 'assets/Exercises/Chest/Videos/male-dumbbell-incline-chest-flys-front.mp4',
//       steps: [
//         '1.Lay flat on the bench and place your feet on the ground.',
//         '2.Begin the exercise with the dumbbells held together above your chest, elbows slightly bent.',
//         '3.Simultaneously lower the weights to either side.',
//         '4.Pause when the weights are parallel to the bench, then raise your arms to the starting position.',
//       ]),
// ];

// List<ExerciseModel> backExercises = [
//   ExerciseModel(
//       img: 'assets/Exercises/Back/Thumbnails/male-cable-goblet-squat-front.png',
//       name: 'Cable Goblet Squat Front',
//       video: 'assets/Exercises/Back/Videos/male-cable-goblet-squat-front.mp4',
//       steps: [
//         '1.Start with a straight bar or easy bar attachment.',
//         '2.Get your elbows directly underneath the bar, squat straight up and then walk back a few steps.',
//         '3.Break at your knees and hips to initiate the squat. Make sure you maintain a flat back.',
//         '4.Squat all the way back to a standing position.'
//       ]),
//   ExerciseModel(img: 'assets/Exercises/Back/Thumbnails/male-cable-pullover-front.png', name: 'Cable Pullover Front', video: 'assets/Exercises/Back/Videos/male-cable-pullover-front.mp4', steps: [
//     '1.You can use any attachment. Cable should be set all the way to the top of the machine.',
//     '2.Grab your attachment and walk a few steps back. Push your butt back to where you are leaning forward somewhat.',
//     '3.Initiate the movement with your shoulders and not your elbows. Imagine trying to pull the attachment through your thighs at the bottom.',
//   ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Back/Thumbnails/male-dumbbell-row-unilateral-side.png',
//       name: 'Dumbbell Row Unilateral Side',
//       video: 'assets/Exercises/Back/Videos/male-dumbbell-row-unilateral-side.mp4',
//       steps: [
//         '1.Brace your off arm against something stable (bench, box). Stagger your stance so your leg on the side of your working arm is back.',
//         '2.Try to get your torso to parallel with the ground. That will extend your range of motion.',
//         '3.Let your arm hang freely and then pull your elbow back. Imagine you\'ve got a tennis ball in your armpit and squeeze it each rep.',
//       ]),
//   ExerciseModel(img: 'assets/Exercises/Back/Thumbnails/male-kettlebell-row-side.png', name: 'Kettle bell Row Side', video: 'assets/Exercises/Back/Videos/male-kettlebell-row-side.mp4', steps: [
//     '1.Stand with your feet shoulder width apart holding the kettle bell with both hands in front of your thighs.',
//     '2.Bend forward at the hips bringing the kettle bell to the floor while you slightly bend your knees, keeping your back straight.',
//     '3.Lift the kettle bell upwards towards your chest and lower - repeat.',
//   ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Back/Thumbnails/male-machine-back-extensions-side.png',
//       name: 'Machine Back Extensions Side',
//       video: 'assets/Exercises/Back/Videos/male-machine-back-extensions-side.mp4',
//       steps: [
//         '1.Position your thighs on the padding and hook your feet on the platform supports.',
//         '2.Keeping your back straight, slowly bend at your waist until your legs and back are at a 45° angle.',
//         '3.Slowly raise your body to the starting position.',
//       ]),
//   ExerciseModel(img: 'assets/Exercises/Back/Thumbnails/male-machine-pulldown-side.png', name: 'Machine Pulldown Side', video: 'assets/Exercises/Back/Videos/male-machine-pulldown-side.mp4', steps: [
//     '1.Grip the bar with the palms facing forward, your hands need to be spaced out at a distance wider than shoulder width.',
//     '2.As you have both arms extended in front of you holding the bar, bring your torso back around 30 degrees while sticking your chest out.',
//     '3.Pull the bar down to about chin level or a little lower in a smooth movement whilst squeezing the shoulder blades together.',
//     '4.After a second of squeezing, slowly raise the bar back to the starting position when your arms are fully extended.'
//   ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Back/Thumbnails/male-machine-seated-cable-row-side.png',
//       name: 'Machine Seated Cable Row Side',
//       video: 'assets/Exercises/Back/Videos/male-machine-seated-cable-row-side.mp4',
//       steps: [
//         '1.Sit with your back straight on the machine and grip the handles.',
//         '2.Pull the handles back using your arms. Your legs and torso should be at a 90° angle. Push out your chest.',
//         '3.Pull the handles towards your body until your hands are beside your abdomen.',
//       ]),
// ];

// List<ExerciseModel> legsExercises = [
//   ExerciseModel(
//       img: 'assets/Exercises/Legs/Thumbnails/male-bodyweight-forward-lunge-side.png',
//       name: 'Bodyweight Forward Lunge Side',
//       video: 'assets/Exercises/Legs/Videos/male-bodyweight-forward-lunge-side.mp4',
//       steps: ['1.Step forward with one leg.', '2.Lower your body until your rear knee nearly touches the ground.', '3.Ensure you remain upright, and your front knee stay above the front foot.']),
//   ExerciseModel(
//       img: 'assets/Exercises/Legs/Thumbnails/male-machine-hamstring-curl-side.png',
//       name: 'Machine Hamstring Curl Side',
//       video: 'assets/Exercises/Legs/Videos/male-machine-hamstring-curl-side.mp4',
//       steps: [
//         '1.Lay down on the machine, placing your legs beneath the padded lever. Position your legs so that the padded lever is below your calve muscles.',
//         '2.Support yourself by grabbing the side handles of the machine, and slowly raise the weight with your legs, toes pointed straight.',
//         '3.Pause at the apex of the motion, then slowly return to starting position.'
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Legs/Thumbnails/male-machine-leg-extension-front.png',
//       name: 'Machine Leg Extension Front',
//       video: 'assets/Exercises/Legs/Videos/male-machine-leg-extension-front.mp4',
//       steps: [
//         '1.Sit on the machine with your back against the cushion and adjust the machine you are using so that your knees are at a 90 degree angle at the starting position.',
//         '2.Raise the weight by extending your knees outward, then lower your leg to the starting position. Both movements should be done in a slow, controlled motion.',
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Legs/Thumbnails/male-machine-leg-press-front.png',
//       name: 'Machine Leg Press Front',
//       video: 'assets/Exercises/Legs/Videos/male-machine-leg-press-front.mp4',
//       steps: [
//         '1.Place your legs on the platform with your feet at shoulder width.',
//         '2.Release the weight and extend your legs fully, without locking your knees.',
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Legs/Thumbnails/male-machine-standing-calf-raises-side.png',
//       name: 'Machine Standing Calf Raises Side',
//       video: 'assets/Exercises/Legs/Videos/male-machine-standing-calf-raises-side.mp4',
//       steps: [
//         '1.Adjust the machine in accordance with your height and place your shoulders underneath the padded lever.',
//         '2.The balls of your feet should be supporting your weight on the calve block, your heels extending off of it.',
//         '3.Extend your heels upwards while keeping your knees stationary, and pause at the contracted position.',
//         '4.Slowly return to the starting position. Repeat.'
//       ]),
// ];

// List<ExerciseModel> shouldersExercises = [
//   ExerciseModel(
//       img: 'assets/Exercises/Shoulders/Thumbnails/male-band-face-pull-side.png',
//       name: 'Band Face Pull Side',
//       video: 'assets/Exercises/Shoulders/Videos/male-band-face-pull-side.mp4',
//       steps: [
//         '1.Anchor the band at eye level. Take a few steps away until the band is taut.',
//         'Use an overhand grip with both hands. Pull the band to the bridge of your nose flaring your elbows out.'
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Shoulders/Thumbnails/male-cable-lateral-raise-front.png',
//       name: 'Cable Lateral Raise Front',
//       video: 'assets/Exercises/Shoulders/Videos/male-cable-lateral-raise-front.mp4',
//       steps: [
//         '1.Use a handle attachment with the cable set all the way to the bottom of the machine.',
//         '2.You should vertically abduct at the shoulder raising your arm straight out to the side.',
//         '3.Raise until your arm is parallel with the ground and then back to the starting position.'
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Shoulders/Thumbnails/male-cable-upright-row-front.png',
//       name: 'Cable Upright Row Front',
//       video: 'assets/Exercises/Shoulders/Videos/male-cable-upright-row-front.mp4',
//       steps: [
//         '1.Use a handle attachment with the cable set to the bottom of the machine.',
//         '2.Pull your elbows straight up toward the ceiling until the attachment is just below your chin then extend until your elbows are fully extended.',
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Shoulders/Thumbnails/male-dumbbell-front-raise-side.png',
//       name: 'Dumbbell Front Raise Side',
//       video: 'assets/Exercises/Shoulders/Videos/male-dumbbell-front-raise-side.mp4',
//       steps: [
//         '1.Grab two dumbbells while standing upright with the dumbbells at your side.',
//         '2.Raise the two dumbbells with your elbows being fully extended until the dumbbells are eye level.',
//         '3.Lower the weights in a controlled manner to the starting position and repeat.',
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Shoulders/Thumbnails/male-dumbbell-lateral-raise-side.png',
//       name: 'Dumbbell Lateral Raise Side',
//       video: 'assets/Exercises/Shoulders/Videos/male-dumbbell-lateral-raise-side.mp4',
//       steps: [
//         '1.Stand up straight with dumbbells at either side, palms facing your hips.',
//         '2.Raise your arms on either side with a slight bend in your elbow until they are parallel with the floor. Pause at the top of the motion.',
//         '3.Slowly return your arms down to starting position.',
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Shoulders/Thumbnails/male-dumbbell-seated-overhead-press-front.png',
//       name: 'Dumbbell Seated Overhead Press-front',
//       video: 'assets/Exercises/Shoulders/Videos/male-dumbbell-seated-overhead-press-front.mp4',
//       steps: [
//         '1.Sit on a bench with back support. Raise the dumbbells to shoulder height with your palms forward.',
//         '2.Raise the dumbbells upwards and pause at the contracted position.',
//         '3.Lower the weights back to starting position.',
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Shoulders/Thumbnails/male-dumbbell-seated-rear-delt-fly-front.png',
//       name: 'Dumbbell Seated Rear Delt Fly Front',
//       video: 'assets/Exercises/Shoulders/Videos/male-dumbbell-seated-rear-delt-fly-front.mp4',
//       steps: [
//         '1.With dumbbells in either hand, bend your knees with your feet slightly bowed out. Arch your back above your knees, and start with the weights touching in front of your chest.',
//         '2.With bent elbows, raise your arms up to shoulder level, pausing at the at the end of the motion.',
//         '3.Slowly lower your arms back to starting position.',
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Shoulders/Thumbnails/male-dumbbell-seated-shrug-front.png',
//       name: 'Dumbbell Seated Shrug Front',
//       video: 'assets/Exercises/Shoulders/Videos/male-dumbbell-seated-shrug-front.mp4',
//       steps: [
//         '1.Sit on a bench with dumbbells in both hands, palms facing your body, back straight.',
//         '2.Elevate your shoulders and hold the contracted position at the apex of the motion.',
//         '3.Slowly lower your shoulders back to starting position',
//       ]),
// ];

// List<ExerciseModel> armExercises = [
//   ExerciseModel(
//       img: 'assets/Exercises/Arm/Thumbnails/biceps-male-dumbbell-curl-front.png',
//       name: 'Biceps Dumbbell Curl Front',
//       video: 'assets/Exercises/Arm/Videos/biceps-male-dumbbell-curl-front.mp4',
//       steps: ['1.Stand up straight with a dumbbell in each hand at arm\'s length.', '2.Raise one dumbbell and twist your forearm until it is vertical and your palm faces the shoulder.']),
//   ExerciseModel(
//       img: 'assets/Exercises/Arm/Thumbnails/biceps-male-barbell-curl-front.png',
//       name: 'Biceps Barbell Curl Front',
//       video: 'assets/Exercises/Arm/Videos/biceps-male-barbell-curl-front.mp4',
//       steps: [
//         '1.While holding the upper arms stationary, curl the weights forward while contracting the biceps as you breathe out.',
//         '2.Continue the movement until your biceps are fully contracted and the bar is at shoulder level.',
//         '3.Hold the contracted position for a second and squeeze the biceps hard.',
//         '4.Slowly bring the weight back down to the starting position.'
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Arm/Thumbnails/biceps-male-kettlebell-preacher-curl-front.png',
//       name: 'Biceps Kettle bell Preacher Curl Front',
//       video: 'assets/Exercises/Arm/Videos/biceps-male-kettlebell-preacher-curl-front.mp4',
//       steps: [
//         '1. Stand behind a bench, with your chest leaning over the edge of the bench.',
//         '2.With one arm resting on the bench, hold the kettle bell, bending the arm at the elbow.',
//         '3.Lower your arm using the bench as a guide, keeping your forearm straight.',
//         '4.Return to the starting position and repeat.'
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Arm/Thumbnails/biceps-male-dumbbell-hammer-curl-front.png',
//       name: 'Biceps Dumbbell Hammer Curl Front',
//       video: 'assets/Exercises/Arm/Videos/biceps-male-dumbbell-hammer-curl-front.mp4',
//       steps: [
//         '1.Hold the dumbbells with a neutral grip (thumbs facing the ceiling).',
//         '2.Slowly lift the dumbbell up to chest height.',
//         '3.Return to starting position and repeat.',
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Arm/Thumbnails/triceps-male-bodyweight-tricep-dips-side.png',
//       name: 'Triceps Bodyweight Tricep Dips Side',
//       video: 'assets/Exercises/Arm/Videos/triceps-male-bodyweight-tricep-dips-side.mp4',
//       steps: [
//         '1.Grip the edge of the bench with your hands, Keep your feet together and legs straight.',
//         '2.Lower your body straight down.',
//         '3.Slowly press back up to the starting point.',
//         'TIP: Make this harder by raising your feet off the floor and adding weight.'
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Arm/Thumbnails/triceps-male-cable-overhead-tricep-extension-front.png',
//       name: 'Triceps Cable Overhead Tricep Extension Front',
//       video: 'assets/Exercises/Arm/Videos/triceps-male-cable-overhead-tricep-extension-front.mp4',
//       steps: [
//         '1.You can use any attachment. The cable should be all the way to the bottom of the machine. Face away from the machine.',
//         '2.Point your elbows straight up toward the ceiling.',
//         '3.From there, extend your elbows until your fists are pointed straight toward the ceiling.',
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Arm/Thumbnails/triceps-male-cable-pushdown-front.png',
//       name: 'Triceps Cable Push down Front',
//       video: 'assets/Exercises/Arm/Videos/triceps-male-cable-pushdown-front.mp4',
//       steps: [
//         '1.You can use any attachment for this. The cable should be set all the way at the top of the machine.',
//         '2.Make sure to keep your upper arm glued at your side. Extend your elbows until you feel your triceps contract.',
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Arm/Thumbnails/triceps-male-cable-push-downs-side.png',
//       name: 'Triceps Cable Push Downs Side',
//       video: 'assets/Exercises/Arm/Videos/triceps-male-cable-push-downs-side.mp4',
//       steps: [
//         '1.Grip the pulley bar with palms facing down at shoulder width.',
//         '2.Stand straight with a small forward incline. Keep your upper arms close to your body, and slowly bring the pulley bar down until your arms are fully extended.',
//         '3.Pause when you are at the contracted position of the motion, then slowly raise the pulley bar back to the starting point.',
//       ]),
//   ExerciseModel(
//       img: 'assets/Exercises/Arm/Thumbnails/triceps-male-cable-skullcrusher-front.png',
//       name: 'Triceps Cable Skull Crusher Front',
//       video: 'assets/Exercises/Arm/Videos/triceps-male-cable-skullcrusher-front.mp4',
//       steps: [
//         '1.You can use a straight bar, rope, easy bar, or two handles. The cable should be set all the way to the top of the machine.',
//         '2.Face away from the machine with your elbows up and the attachment just behind your head.',
//       ]),
// ];

// List<ExerciseModel> upperPartExercises = [
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Upper_Parts/01.png', name: '01', video: 'assets/Exercises/Warm_Up/Upper_Parts/01.mp4', steps: ["-Do it 10-15 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Upper_Parts/02.png', name: '02', video: 'assets/Exercises/Warm_Up/Upper_Parts/02.mp4', steps: ["-Do it 10-15 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Upper_Parts/03.png', name: '03', video: 'assets/Exercises/Warm_Up/Upper_Parts/03.mp4', steps: ["-Do it 10-15 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Upper_Parts/04.png', name: '04', video: 'assets/Exercises/Warm_Up/Upper_Parts/04.mp4', steps: ["-Do it 10-15 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Upper_Parts/05.png', name: '05', video: 'assets/Exercises/Warm_Up/Upper_Parts/05.mp4', steps: ["-Do it 10-15 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Upper_Parts/06.png', name: '06', video: 'assets/Exercises/Warm_Up/Upper_Parts/06.mp4', steps: ["-Do it 10-15 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Upper_Parts/07.png', name: '07', video: 'assets/Exercises/Warm_Up/Upper_Parts/07.mp4', steps: ["-Do it 10-15 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Upper_Parts/08.png', name: '08', video: 'assets/Exercises/Warm_Up/Upper_Parts/08.mp4', steps: ["-Do it 10-15 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Upper_Parts/15.png', name: '09', video: 'assets/Exercises/Warm_Up/Upper_Parts/15.mp4', steps: ["-Do it 10-15 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Upper_Parts/16.png', name: '10', video: 'assets/Exercises/Warm_Up/Upper_Parts/16.mp4', steps: ["-Do it 10-15 times."]),
// ];

// List<ExerciseModel> lowerPartExercises = [
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Lower_Parts/09.png', name: '01', video: 'assets/Exercises/Warm_Up/Lower_Parts/09.mp4', steps: ["-Do it 15-20 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Lower_Parts/10.png', name: '02', video: 'assets/Exercises/Warm_Up/Lower_Parts/10.mp4', steps: ["-Do it 15-20 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Lower_Parts/11.png', name: '03', video: 'assets/Exercises/Warm_Up/Lower_Parts/11.mp4', steps: ["-Do it 15-20 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Lower_Parts/12.png', name: '04', video: 'assets/Exercises/Warm_Up/Lower_Parts/12.mp4', steps: ["-Do it 15-20 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Lower_Parts/13.png', name: '05', video: 'assets/Exercises/Warm_Up/Lower_Parts/13.mp4', steps: ["-Do it 15-20 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Lower_Parts/14.png', name: '06', video: 'assets/Exercises/Warm_Up/Lower_Parts/14.mp4', steps: ["-Do it 15-20 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Lower_Parts/17.png', name: '07', video: 'assets/Exercises/Warm_Up/Lower_Parts/17.mp4', steps: ["-Do it 15-20 times."]),
//   ExerciseModel(img: 'assets/Exercises/Warm_Up/Lower_Parts/18.png', name: '08', video: 'assets/Exercises/Warm_Up/Lower_Parts/18.mp4', steps: ["-Do it 15-20 times."]),
// ];
