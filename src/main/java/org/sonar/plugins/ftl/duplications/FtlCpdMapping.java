/*
 * Sonar Web Plugin
 * Copyright (C) 2010 Matthijs Galesloot
 * dev@sonar.codehaus.org
 *
 * Licensed under the Apache License, Version 2.0 (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.sonar.plugins.ftl.duplications;

import org.sonar.plugins.ftl.core.Ftl;

import net.sourceforge.pmd.cpd.Tokenizer;
import org.sonar.api.batch.CpdMapping;
import org.sonar.api.resources.File;
import org.sonar.api.resources.Language;
import org.sonar.api.resources.Resource;

import java.util.List;

public class FtlCpdMapping implements CpdMapping {

  private final Ftl ftl;

  public FtlCpdMapping(Ftl ftl) {
    this.ftl = ftl;
  }

  public Tokenizer getTokenizer() {
    return new FtlCpdTokenizer();
  }

  @SuppressWarnings("rawtypes")
  public Resource createResource(java.io.File file, List<java.io.File> sourceDirs) {
    return File.fromIOFile(file, sourceDirs);
  }

  public Language getLanguage() {
    return ftl;
  }

}
