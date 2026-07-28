import winreg, os, subprocess

# Map G: to D: via subst
subprocess.run(['cmd.exe', '/c', 'subst G: D:\\'], capture_output=True)

key = winreg.OpenKey(winreg.HKEY_CURRENT_USER, r'Software\Borland\Delphi\7.0\Library')
raw_paths, _ = winreg.QueryValueEx(key, 'Search Path')
delphi_dir = r'C:\Program Files (x86)\Borland\Delphi7'

paths = []
for p in raw_paths.split(';'):
    if p.strip():
        p_expanded = p.strip().replace('$(DELPHI)', delphi_dir)
        paths.append(p_expanded)

extra_dirs = [
    r'd:\Delphi7\ZeosLib-8.0\packages\delphi7\build',
    r'd:\Delphi7\ZeosLib-8.0\src\component',
    r'd:\Delphi7\ZeosLib-8.0\src\core',
    r'd:\Delphi7\ZeosLib-8.0\src\dbc',
    r'd:\Delphi7\ZeosLib-8.0\src\parsesql',
    r'd:\Delphi7\ZeosLib-8.0\src\plain',
    r'C:\Program Files (x86)\Borland\Delphi7\Projects\Bpl',
    r'C:\Program Files (x86)\Borland\Delphi7\Lib',
    r'C:\Program Files (x86)\Borland\Delphi7\Imports'
]

for zd in extra_dirs:
    if zd not in paths:
        paths.append(zd)

cfg_path = r'd:\Delphi7\BigLotto2.65D2\BigLotto.cfg'
with open(cfg_path, 'w', encoding='cp874', errors='ignore') as f:
    f.write('-U"' + ';'.join(paths) + '"\n')
    f.write('-R"' + ';'.join(paths) + '"\n')
    f.write('-I"' + ';'.join(paths) + '"\n')

cmd = [
    r'C:\Program Files (x86)\Borland\Delphi7\Bin\dcc32.exe',
    '-B',
    r'd:\Delphi7\BigLotto2.65D2\BigLotto.dpr'
]

res = subprocess.run(cmd, capture_output=True, text=True, cwd=r'd:\Delphi7\BigLotto2.65D2')
print('STDOUT:\n', res.stdout[-2000:])
print('STDERR:\n', res.stderr)
print('Return code:', res.returncode)

