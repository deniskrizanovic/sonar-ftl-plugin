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
package org.sonar.plugins.ftl.core;

import com.google.common.collect.Lists;
import org.apache.commons.lang.StringUtils;
import org.sonar.api.Properties;
import org.sonar.api.Property;
import org.sonar.api.config.Settings;
import org.sonar.api.resources.AbstractLanguage;
import org.sonar.plugins.ftl.api.FtlConstants;

import java.util.ArrayList;

/**
 * This class defines the Ftl language.
 *
 * @author Matthijs Galesloot
 * @since 1.0
 */
@Properties({
  @Property(key = FtlConstants.FILE_EXTENSIONS_PROP_KEY,
    name = "File extensions",
    description = "List of file extensions that will be scanned.",
    defaultValue = FtlConstants.FILE_EXTENSIONS_DEF_VALUE,
    global = true,
    project = true)
})
public class Ftl extends AbstractLanguage {

  private String[] fileSuffixes;

  /**
   * Default constructor.
   */
  public Ftl(Settings settings) {
    super(FtlConstants.LANGUAGE_KEY, FtlConstants.LANGUAGE_NAME);
    String extensions = settings.getString(FtlConstants.FILE_EXTENSIONS_PROP_KEY);
    if (StringUtils.isBlank(extensions)) {
      extensions = FtlConstants.FILE_EXTENSIONS_DEF_VALUE;
    }
    ArrayList<String> extensionsList = Lists.newArrayList();
    for (String extension : StringUtils.split(extensions, ",")) {
      extensionsList.add(extension.trim());
    }
    fileSuffixes = extensionsList.toArray(new String[extensionsList.size()]);
  }

  /**
   * {@inheritDoc}
   */
  public String[] getFileSuffixes() {
    return fileSuffixes;
  }
}
