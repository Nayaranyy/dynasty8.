// Połączenie z Supabase.
// Wklej tutaj dane z: Supabase → Project Settings → API.
// UWAGA: wklej klucz "anon" / "public" (NIGDY "service_role").
// Klucz anon jest przeznaczony do użycia w przeglądarce – bezpieczeństwo zapewniają reguły RLS z pliku supabase.sql.
window.D8_CONFIG = {
  SUPABASE_URL: 'https://uqtneaiejkffpifhtrxu.supabase.co',        // np. https://abcdefgh.supabase.co
  SUPABASE_ANON_KEY: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVxdG5lYWllamtmZnBpZmh0cnh1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTA4NzQ4ODksImV4cCI6MjEwNjQ1MDg4OX0.FAfLebMgnqPvQgL9lY73LbLV4Dzhmy5MJofFaOowyug'    // długi klucz zaczynający się od eyJ...
};
