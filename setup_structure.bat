@echo off
REM === Create API folders and files ===
mkdir api\auth
echo.> api\auth\login.php
echo.> api\auth\register.php
echo.> api\auth\logout.php
echo.> api\auth\refresh.php

mkdir api\user
echo.> api\user\profile.php
echo.> api\user\dashboard.php
echo.> api\user\update.php

mkdir api\messages
echo.> api\messages\get.php
echo.> api\messages\send.php
echo.> api\messages\mark_read.php

mkdir api\visitors
echo.> api\visitors\list.php
echo.> api\visitors\track.php

mkdir api\config
echo.> api\config\api_config.php
echo.> api\config\jwt_helper.php

REM === Flutter App Folders and Files ===
mkdir flutter_app
cd flutter_app

mkdir lib
cd lib

mkdir config
echo.> config\app_config.dart
echo.> config\api_endpoints.dart

mkdir models
echo.> models\user.dart
echo.> models\message.dart
echo.> models\visitor.dart
echo.> models\api_response.dart

mkdir services
echo.> services\api_service.dart
echo.> services\auth_service.dart
echo.> services\message_service.dart
echo.> services\storage_service.dart

mkdir screens
cd screens

mkdir auth
echo.> auth\login_screen.dart
echo.> auth\register_screen.dart

mkdir dashboard
echo.> dashboard\dashboard_screen.dart
echo.> dashboard\profile_screen.dart

mkdir chat
echo.> chat\chat_list_screen.dart
echo.> chat\chat_screen.dart

mkdir visitors
echo.> visitors\visitors_screen.dart

cd ..

mkdir widgets
cd widgets
mkdir common
mkdir chat
mkdir dashboard
cd ..

mkdir utils
echo.> utils\constants.dart
echo.> utils\helpers.dart
echo.> utils\validators.dart

cd ..
cd ..

echo.> pubspec.yaml
echo.> README.md
echo.> lib\main.dart

REM === Done ===
echo All folders and placeholder files created successfully.
pause
