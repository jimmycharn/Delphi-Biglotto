import winreg, os, subprocess

key = winreg.OpenKey(winreg.HKEY_CURRENT_USER, r'Software\Borland\Delphi\7.0\Library')
raw_paths, _ = winreg.QueryValueEx(key, 'Search Path')
delphi_dir = r'C:\Program Files (x86)\Borland\Delphi7'

paths = []
for p in raw_paths.split(';'):
    if p.strip():
        p_expanded = p.strip().replace('$(DELPHI)', delphi_dir)
        if os.path.exists(p_expanded):
            paths.append(p_expanded)

zeos_dirs = [
    r'd:\Delphi7\ZeosLib-8.0\packages\delphi7\build',
    r'd:\Delphi7\ZeosLib-8.0\src\component',
    r'd:\Delphi7\ZeosLib-8.0\src\core',
    r'd:\Delphi7\ZeosLib-8.0\src\dbc',
    r'd:\Delphi7\ZeosLib-8.0\src\parsesql',
    r'd:\Delphi7\ZeosLib-8.0\src\plain'
]

for zd in zeos_dirs:
    if zd not in paths and os.path.exists(zd):
        paths.append(zd)

cfg_path = r'd:\Delphi7\BigLotto2.65D2\BigLotto.cfg'
with open(cfg_path, 'w', encoding='cp874', errors='ignore') as f:
    f.write('-U"' + ';'.join(paths) + '"\n')

cmd = [
    r'C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe',
    '-B',
    r'd:\Delphi7\BigLotto2.65D2\BigLotto.dpr'
]

res = subprocess.run(cmd, capture_output=True, text=True, cwd=r'd:\Delphi7\BigLotto2.65D2')
print('STDOUT:\n', res.stdout[-3000:])
print('STDERR:\n', res.stderr)
print('Return code:', res.returncode)
