import re
import numpy as np

from itertools import cycle

classic_tempos = {
    "grave": 32,
    "largoassai": 40,
    "largo": 50,
    "pocolargo": 60,
    "adagio": 71,
    "pocoadagio": 76,
    "andante": 92,
    "andantino": 100,
    "menuetto": 112,
    "moderato": 114,
    "pocoallegretto": 116,
    "allegretto": 118,
    "allegromoderato": 120,
    "pocoallegro": 124,
    "allegro": 130,
    "moltoallegro": 134,
    "allegroassai": 138,
    "vivace": 140,
    "vivaceassai": 150,
    "allegrovivace": 160,
    "allegrovivaceassai": 170,
    "pocopresto": 180,
    "presto": 186,
    "prestoassai": 200,
}


class Labels(object):  # 38 symbols
    def __init__(self):
        # yapf: disable
        self.labels = [
            "+",  # ctc blank
            "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
            "C", "D", "E", "F", "G", "A", "B", "c", "d", "e", "f", "g", "a", "b",  # noqa E501
            "r", "#", "-", "=", ".", "[", "_", "]", ";", "\t", "\n",
            "<", ">"  # seq2seq <sos> and <eos> delimiters
        ]
        # yapf: enable
        self.labels_map = dict([(c, i) for (i, c) in enumerate(self.labels)])
        self.labels_map_inv = dict([(i, c)
                                    for (i, c) in enumerate(self.labels)])

    def ctclen(self, tokens):
        count = len(tokens)
        count += sum([tokens[i - 1] == tokens[i] for i in range(1, count)])
        return count

    def encode(self, chars):
        tokens = []
        for c in chars:
            tokens.append(self.labels_map[c])
        return tokens

    def decode(self, tokens):
        return list(filter(None, [self.labels_map_inv.get(t) for t in tokens]))


class LabelsMultiple(object):  # 148/173 symbols
    def __init__(self, extended=False):
        # yapf: disable
        self.labels = [
            "+",  # ctc blank
            "1","1.","2","2.","4","4.","8","8.","16","16.","32","32.","64","64.","3","6","12","24","48","96",                           # noqa E501 E231
            "BBB#","CC","CC#","DD-","DD","DD#","EE-","EE","EE#","FF-","FF","FF#","GG-","GG","GG#","AA-","AA","AA#","BB-","BB","BB#",    # noqa E501 E231
            "C-","C","C#","D-","D","D#","E-","E","E#","F-","F","F#","G-","G","G#","A-","A","A#","B-","B","B#",                          # noqa E501 E231
            "c-","c","c#","d-","d","d#","e-","e","e#","f-","f","f#","g-","g","g#","a-","a","a#","b-","b","b#",                          # noqa E501 E231
            "cc-","cc","cc#","dd-","dd","dd#","ee-","ee","ee#","ff-","ff","ff#","gg-","gg","gg#","aa-","aa","aa#",                      # noqa E501 E231
            "bb-","bb","bb#",                                                                                                           # noqa E501 E231
            "ccc-","ccc","ccc#","ddd-","ddd","ddd#","eee-","eee","eee#","fff-","fff","fff#","ggg-","ggg","ggg#","aaa-","aaa","aaa#",    # noqa E501 E231
            "bbb-","bbb","bbb#",                                                                                                        # noqa E501 E231
            "cccc-","cccc","cccc#","dddd-","dddd","dddd#","eeee-","eeee","eeee#","ffff-","ffff",                                        # noqa E501 E231
            "r", "=", ".", "[", "_", "]", ";", "\t", "\n",
            "<sos>", "<eos>"  # seq2seq delimiters
        ]
        if extended:
            self.labels.extend([
                "128","20","40","176","112",                                                # noqa E501 E231
                "CCC","CCC#","DDD-","DDD","DDD#","EEE-","EEE","EEE#","FFF-","FFF",          # noqa E501 E231
                "FFF#","GGG-","GGG","GGG#","AAA-","AAA","AAA#","BBB-","BBB","CC-"           # noqa E501 E231
            ])
        # yapf: enable
        self.labels_map = dict([(c, i) for (i, c) in enumerate(self.labels)])
        self.labels_map_inv = dict([(i, c)
                                    for (i, c) in enumerate(self.labels)])

    def ctclen(self, tokens):
        return len(tokens)

    def encode(self, chars):
        tokens = []
        for line in chars.splitlines():
            items = line.split('\t')
            for item in items:
                if len(item) == 1:
                    tokens.append(self.labels_map[item])
                else:
                    matchobj = re.fullmatch(
                        r'(\[?)(\d+\.*)([a-gA-Gr]{1,4}[\-#]*)(;?)([\]_]?)',
                        item)
                    if not matchobj:
                        raise Exception(
                            f'Item {item} in {line} does not match')
                    for m in [
                            matchobj[1], matchobj[2], matchobj[3], matchobj[4],
                            matchobj[5]
                    ]:
                        if m:
                            tokens.append(self.labels_map[m])
                tokens.append(self.labels_map['\t'])
            tokens[-1] = self.labels_map['\n']
        tokens.pop(-1)
        return tokens

    def decode(self, tokens):
        return list(filter(None, [self.labels_map_inv.get(t) for t in tokens]))


class LabelsSingle(object):  # 9147/13632 symbols
    def __init__(self, extended=False):
        # yapf: disable
        durations = ["1","1.","2","2.","4","4.","8","8.","16","16.","32","32.","64","64.","3","6","12","24","48","96"]                          # noqa E501 E231
        notes = ["BBB#","CC","CC#","DD-","DD","DD#","EE-","EE","EE#","FF-","FF","FF#","GG-","GG","GG#","AA-","AA","AA#","BB-","BB","BB#",       # noqa E501 E231
            "C-","C","C#","D-","D","D#","E-","E","E#","F-","F","F#","G-","G","G#","A-","A","A#","B-","B","B#",                                  # noqa E501 E231
            "c-","c","c#","d-","d","d#","e-","e","e#","f-","f","f#","g-","g","g#","a-","a","a#","b-","b","b#",                                  # noqa E501 E231
            "cc-","cc","cc#","dd-","dd","dd#","ee-","ee","ee#","ff-","ff","ff#","gg-","gg","gg#","aa-","aa","aa#",                              # noqa E501 E231
            "bb-","bb","bb#",                                                                                                                   # noqa E501 E231
            "ccc-","ccc","ccc#","ddd-","ddd","ddd#","eee-","eee","eee#","fff-","fff","fff#","ggg-","ggg","ggg#","aaa-","aaa","aaa#",            # noqa E501 E231
            "bbb-","bbb","bbb#",                                                                                                                # noqa E501 E231
            "cccc-","cccc","cccc#","dddd-","dddd","dddd#","eeee-","eeee","eeee#"]                                                               # noqa E501 E231
        if extended:
            durations.extend(["128","20","40","176","112"])                                     # noqa E501 E231
            notes.extend([
                "CCC","CCC#","DDD-","DDD","DDD#","EEE-","EEE","EEE#","FFF-","FFF","FFF#",       # noqa E501 E231
                "GGG-","GGG","GGG#","AAA-","AAA","AAA#","BBB-","BBB","CC-", "ffff-","ffff"])    # noqa E501 E231
        # yapf: enable
        # ties = ["[", "_", "]"]
        self.labels = ['+']  # ctc blank
        for d in durations:
            for n in notes:
                self.labels.append(d + n)
                self.labels.append('[' + d + n)
                self.labels.append(d + n + '_')
                self.labels.append(d + n + ']')
            self.labels.append(d + 'r')
        self.labels.extend([
            "=",
            ".",
            "\t",
            "\n",
            "<sos>",
            "<eos>",  # seq2seq delimiters
        ])
        self.labels_map = dict([(c, i) for (i, c) in enumerate(self.labels)])
        self.labels_map_inv = dict([(i, c)
                                    for (i, c) in enumerate(self.labels)])

    def ctclen(self, tokens):
        return len(tokens)

    def encode(self, chars):
        tokens = []
        for line in chars.splitlines():
            items = line.split('\t')
            for item in items:
                tokens.append(self.labels_map[item])
                tokens.append(self.labels_map['\t'])
            tokens[-1] = self.labels_map['\n']
        tokens.pop(-1)
        return tokens

    def decode(self, tokens):
        return list(filter(None, [self.labels_map_inv.get(t) for t in tokens]))


class Humdrum(object):
    def __init__(self, path=None, data=None):
        if path:
            data = path.read_text(encoding='iso-8859-1')
        lines = data.splitlines()
        body_begin = 0
        body_end = 0
        for i, line in enumerate(lines):
            if line.startswith('**'):
                body_begin = i + 1
            if line.startswith('*-'):
                body_end = i
                break
        self.header = lines[:body_begin]
        self.footer = lines[body_end:]
        self.body = lines[body_begin:body_end]
        self.spine_types = self.header[-1].split('\t')

    def save(self, path):
        return path.write_text(self.dump(), encoding='iso-8859-1')

    def dump(self):
        return '\n'.join(self.header + self.body + self.footer)


class SpineInfo(object):
    def __init__(self, spine_types):
        self.spines = []
        for stype in spine_types:
            self.spines.append({
                'type': stype,
                'instrument': '*',
                'clef': '*',
                'keysig': '*',
                'tonality': '*',
                'timesig': '*',
                'metronome': '*',
            })

    def update(self, line):
        for i, item in enumerate(line.split('\t')):
            if item.startswith('*k['):
                self.spines[i]['keysig'] = item
            elif item.startswith('*clef'):
                self.spines[i]['clef'] = item
            elif item.startswith('*I'):
                self.spines[i]['instrument'] = item
            elif item.startswith('*MM'):
                self.spines[i]['metronome'] = item
            elif item.startswith('*M'):
                self.spines[i]['timesig'] = item
            elif item.startswith('*CT'):
                item = f'*MM{classic_tempos[item[3:]]}'
                self.spines[i]['metronome'] = item
            elif item.endswith(':'):
                self.spines[i]['tonality'] = item

    def override_instruments(self, instruments):
        pool = cycle(instruments)
        inst = instruments[0]
        for i in range(len(self.spines)):
            if self.spines[i]['type'] == '**kern':
                inst = next(pool)
            self.spines[i]['instrument'] = f'*I{inst}'

    def dump(self):
        header = []
        for v in [
                'type', 'instrument', 'clef', 'keysig', 'tonality', 'timesig',
                'metronome'
        ]:
            header.append('\t'.join([x[v] for x in self.spines]))
        footer = ['\t'.join(['*-' for x in self.spines])]
        return header, footer

    def clone(self):
        spine_types = [s['type'] for s in self.spines]
        spineinfo = SpineInfo(spine_types)
        spineinfo.spines = self.spines.copy()
        return spineinfo


class Kern(Humdrum):
    def __init__(self, path=None, data=None, constrained=True):
        super(Kern, self).__init__(path, data)

        self.constrained = constrained
        self.spines = SpineInfo(self.spine_types)
        self.first_line = 0
        for i, line in enumerate(self.body):
            if not line.startswith('*') or re.search(r'\*[\^v]', line):
                self.first_line = i
                break
            self.spines.update(line)

    def clean(self, remove_pauses=True):
        spine_types = self.spine_types.copy()
        base_spine_len = len(spine_types)
        newbody = []

        for line in self.body[self.first_line:]:
            if len(line) == 0:
                continue
            if re.search(r'\*[+x\^v]', line):
                i = 0
                remove_spine = False
                newline = []
                min_split_counts = 100
                for item in line.split('\t'):
                    if item.startswith(('*+', '*x')):
                        print('Unsupported variable spines')
                        return False
                    if item == '*^':
                        spine_types.insert(i + 1, f'{spine_types[i]}**split')
                        i += 1
                    elif item == '*v':
                        min_split_counts = min(min_split_counts,
                                               spine_types[i].count('**split'))
                        if remove_spine:
                            spine_types.pop(i)
                            i -= 1
                        else:
                            remove_spine = True
                    else:
                        if remove_spine:
                            # Last was removed:
                            # Transform first spine into simpler type.
                            spine_types[i - 1] = (
                                f"{spine_types[i-1].replace('**split', '')}"
                                f"{min_split_counts * '**split'}")
                        remove_spine = False
                    i += 1
                    newline.append(item)
                if not self.constrained:
                    newbody.append('\t'.join(newline))

                continue

            if line.startswith('!'):
                # Support for local comments (one per spine starting with '!').
                if self.constrained:
                    newline = []
                    items = line.split('\t')
                    for i, item in enumerate(items):
                        if spine_types[i].endswith(
                                '**split') and base_spine_len < len(items):
                            # Remove spline split
                            continue
                        newline.append(item)
                    newbody.append('\t'.join(newline))
                else:
                    newbody.append(line)
                continue

            # Remove unwanted symbols
            newline = []
            note_found = False
            grace_note_found = False

            items = line.split('\t')
            for i, item in enumerate(items):
                if self.constrained and spine_types[i].endswith('**split') \
                        and base_spine_len < len(items):
                    # print(f'Discarding item! {line}: {item}')
                    # Remove spline split
                    continue

                if spine_types[i].startswith('**kern') and \
                        not item.startswith(('*', '=')):
                    if self.constrained:
                        item = item.split()[0]  # Take first note of chord
                    item = re.sub(r'[pTtMmWwS$O:]', r'',
                                  item)  # Remove ornaments
                    if remove_pauses:
                        item = re.sub(r';', r'', item)  # Remove pauses
                    item = re.sub(r'[JKkL\\/]', r'',
                                  item)  # Remove beaming and stems
                    item = re.sub(
                        r'[(){}xXyY&]', r'', item
                    )  # Remove slurs, phrases, elisions and editorial marks
                    item = re.sub(r'(\d*\.*r)(.*)', r'\1',
                                  item)  # Remove the rests line position.
                    if re.search('[qQP]', item):
                        grace_note_found = True
                    elif re.search('[A-Ga-g]', item):
                        note_found = True
                newline.append(item)

            # Remove grace note lines unless they contain a non-grace note in the same time line
            if grace_note_found and not note_found:
                continue

            if grace_note_found and note_found:
                print(f'Unremovable grace notes {line}')
                return False

            if not all([x == '.' for x in newline]) and \
                    not all([x == '!' for x in newline]):
                newbody.append('\t'.join(newline))

        header, footer = self.spines.dump()
        self.body = header[1:] + newbody
        self.first_line = len(header) - 1
        return True

    def split(self, chunk_sizes, stride=None):
        chunks = []
        spines = self.spines.clone()

        measures = [self.first_line]
        for i, line in enumerate(self.body[self.first_line:]):
            if re.match(r'^=(\d+|=)[^-]*', line):
                measures.append(i + self.first_line + 1)
        i = 0
        while i < len(measures) - 1:
            chunk_size = min(np.random.choice(chunk_sizes),
                             len(measures) - i - 1)
            m_begin = measures[i]
            m_end = measures[i + chunk_size]

            header, footer = spines.dump()

            i += stride if stride else chunk_size

            final_measurement = False
            if len(measures) - i - 1 < min(chunk_sizes):
                body = self.body[m_begin:]
                final_measurement = True
            else:
                body = self.body[m_begin:m_end]

            # Fix spine splits
            if not self.constrained:
                # Fix first line of body.
                len_spines = len(self.spine_types)
                if len_spines != len(body[0].split('\t')):
                    # Get lines splits until len match spines, index is reversed
                    split_lines = []
                    lookup_body = self.body[:m_begin]

                    for line in lookup_body[::-1]:
                        # Instead of updating the spines, just insert all
                        # modifications after the original header
                        # if re.search(r'\*[\^v]', line):
                        if re.search(r'\*|:$', line):
                            split_lines.append(line)
                            if len(line.split('\t')) == len_spines:
                                break
                    # Insert all split lines in correct order:
                    for split_line in split_lines:
                        body.insert(0, split_line)

                # Fix footer. Skip comments.
                last = -1
                while body[last].startswith('!'):
                    last -= 1

                if len(footer[0].split('\t')) != len(body[last].split('\t')):
                    footer = [
                        '\t'.join(['*-' for x in body[last].split('\t')])
                    ]

            chunk = Kern(data='\n'.join(header + body + footer))
            chunks.append(chunk)

            if final_measurement:
                break

            # If not removing splits, no need to update the spines for the
            # next chunks as all split lines and marks are added after header.
            if self.constrained:
                for line in self.body[m_begin:measures[i]]:
                    if line.startswith('*'):
                        spines.update(line)

        return chunks

    def tosequence(self):
        spine_types = self.spine_types.copy()
        krn = []
        for line in self.body[self.first_line:]:
            newline = []
            if line.startswith('='):
                if not re.match(r'^=(\d+|=)[^-]*', line):
                    continue
                newline.append('=')
            elif not self.constrained and re.search(r'\*[\^v]', line):
                i = 0
                remove_spine = False
                min_split_counts = 100
                for item in line.split('\t'):
                    if item == '*^':
                        spine_types.insert(i + 1, f'{spine_types[i]}**split')
                        i += 1
                    elif item == '*v':
                        min_split_counts = min(min_split_counts,
                                               spine_types[i].count('**split'))
                        if remove_spine:
                            spine_types.pop(i)
                            i -= 1
                        else:
                            remove_spine = True
                    else:
                        if remove_spine:
                            # Last was removed:
                            # Transform first spine into simpler type.
                            spine_types[i - 1] = (
                                f"{spine_types[i-1].replace('**split', '')}"
                                f"{min_split_counts * '**split'}")
                        remove_spine = False
                    i += 1
                continue
            elif line.startswith(('*', '!')):
                continue
            else:
                line = re.sub(r'[^rA-Ga-g0-9.\[_\]#\-;\t ]', r'',
                              line)  # Remove undefined symbols
                for i, item in enumerate(line.split('\t')):
                    if spine_types[i].startswith('**kern'):
                        # Chords splitting:
                        if not self.constrained and ' ' in item:
                            chord = item.split()
                            for note in chord:
                                newline.append(note)
                        else:
                            newline.append(item)

            krn.append('\t'.join(newline))

        krnseq = '\n'.join(krn)

        if re.search(r'(#|-|\.){2,}', krnseq):
            # Discard double sharps/flats/dots
            return None

        return krnseq
