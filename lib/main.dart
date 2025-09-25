import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://zoldbvncvfnldkgbyzzx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpvbGRidm5jdmZubGRrZ2J5enp4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTg3ODY0NTUsImV4cCI6MjA3NDM2MjQ1NX0.A9mQEKhifMsGF4QuSmdg3UhMv2USDqlCDIqpI_NyE6U',
  );
  runApp(App());
}